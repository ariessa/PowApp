import 'package:flutter/material.dart';
import 'misc.dart';
import 'dashboard_main.dart';
import 'package:pow/customer_main.dart';
import 'package:pow/billing_main.dart';
import 'inventory_main.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  // final FirebaseUser currentUser;

  // HomePage(this.currentUser);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            padding: EdgeInsets.all(30),
            height: SizeConfig.blockSizeVertical * 20,
            width: SizeConfig.screenWidth,
            child: ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardMain())),
            leading: Image.asset('assets/Payment.png'),
            title: 
              Padding(
                padding: EdgeInsets.only(left: 60),
                child:
                  Text('Dashboard'.toUpperCase(), textScaleFactor: 1.2,
                    style: TextStyle(
                    color: Color(0xff2699fb), fontWeight: FontWeight.bold)), 
              )
          ),
          ),
          Container(
            decoration: BoxDecoration(color: const Color(0xfff1f9ff)),
            padding: EdgeInsets.all(30),
            height: SizeConfig.blockSizeVertical * 20,
            width: SizeConfig.screenWidth,
            child: ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BillingMain())),
            leading: Image.asset('assets/Billing.png'),
            title: 
              Padding(
                padding: EdgeInsets.only(left: 60),
                child:
                  Text('Billing'.toUpperCase(), textScaleFactor: 1.2,
                    style: TextStyle(
                    color: Color(0xff2699fb), fontWeight: FontWeight.bold)), 
              )
          ),
          ),
          Container(
            decoration: BoxDecoration(color: const Color(0xffbce0fd)),
            padding: EdgeInsets.all(30),
            height: SizeConfig.blockSizeVertical * 20,
            width: SizeConfig.screenWidth,
            child: ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryMain())),
              leading: Image.asset('assets/Inventory.png'),
              title: 
                Padding(
                  padding: EdgeInsets.only(left: 60),
                  child:
                    Text('Inventory'.toUpperCase(), textScaleFactor: 1.2,
                      style: TextStyle(
                      color: Color(0xff2699fb), fontWeight: FontWeight.bold)), 
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(color: const Color(0xff7fc4fd)),
            padding: EdgeInsets.all(30),
            height: SizeConfig.blockSizeVertical * 20,
            width: SizeConfig.screenWidth,
            child: ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerMain())),
              leading: Image.asset('assets/Customer.png'),
              title: 
              Padding(
                padding: EdgeInsets.only(left: 60),
                child:
                  Text('Customer'.toUpperCase(), textScaleFactor: 1.2,
                    style: TextStyle(
                    color: Color(0xff2699fb), fontWeight: FontWeight.bold)), 
              )
          ),
          ),
          Container(
            decoration: BoxDecoration(color: const Color(0xff2699fb)),
            padding: EdgeInsets.all(30),
            height: SizeConfig.blockSizeVertical * 20 ,
            width: SizeConfig.screenWidth,
            child: ListTile(
              onTap: () async {
                //await Provider.of<AuthService>(context).logout();
                _asyncConfirmDialog(context);
              },
              leading: Image.asset('assets/Profile.png'),
              title: 
              Padding(
                padding: EdgeInsets.only(left: 60),
                child:
                  Text('Log Out'.toUpperCase(), textScaleFactor: 1.2,
                    style: TextStyle(
                    color: Color(0xffbce0fd), fontWeight: FontWeight.bold)), 
              )
          ),
          ),
        ],
      )
      );
    }
}

	
enum ConfirmAction { CANCEL, CONFIRM}
 
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log Out'),
        content: const Text(
            'Are you sure you want to log out?'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('CONFIRM'),
            onPressed: () async {
              Navigator.of(context).pop(ConfirmAction.CONFIRM);
              await Provider.of<AuthService>(context).logout();
            },
          )
        ],
      );
    },
  );
}


class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///
  /// return the Future with firebase user object FirebaseUser if one exists
  ///
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  // wrapping the firebase calls
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  // wrapping the firebase calls
  Future createUser(
      {String firstName,
      String lastName,
      String email,
      String password}) async {
    var r = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    var u = r.user;
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = '$firstName $lastName';
    return await u.updateProfile(info);
  }

  ///
  /// wrapping the firebase call to signInWithEmailAndPassword
  /// `email` String
  /// `password` String
  ///
  Future<FirebaseUser> loginUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // since something changed, let's notify the listeners...
      notifyListeners();
      return result.user;
    }  catch (e) {
      throw new AuthException(e.code, e.message);
    }
  }
}