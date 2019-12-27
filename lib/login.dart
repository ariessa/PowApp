import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'package:provider/provider.dart';
import 'package:pow/menu.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(10.0),
        child: Container(
            // padding: EdgeInsets.all(10.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: SizeConfig.screenWidth,
                        height: 280,
                        child: Container(
                          color: Color(0xfff1f9ff),
                          constraints: BoxConstraints.expand(),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 50.0),
                              Image.asset('assets/Logo.png'),
                              SizedBox(height: 20.0),
                              Text('POW',
                                textScaleFactor: 2.0, 
                                style: TextStyle(
                                  color: Color(0xff2699fb), 
                                  fontWeight: FontWeight.bold,
                                )
                              )
                            ],
                          )
                        ),
                        
                      ),
                      
                    ],
                  ),
                  // SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _email = value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _password = value,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: const Color(0xff2699fb)),
                      child: Text("LOGIN", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                    ),
                    onTap: () async {
                      // save the fields..
                      final form = _formKey.currentState;
                      form.save();

                      // Validate will return true if is valid, or false if invalid.
                      if (form.validate()) {
                        try {
                          FirebaseUser result =
                              await Provider.of<AuthService>(context).loginUser(
                                  email: _email, password: _password);
                          print(result);
                        } on AuthException catch (error) {
                          return _buildErrorDialog(context, error.message);
                        } on Exception catch (error) {
                          return _buildErrorDialog(context, error.toString());
                        }
                      }
                    },
                  ),
                ]
                )
                )
                ),
    )
    );
  }

  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}