import 'package:flutter/material.dart';
import 'package:pow/menu.dart';
import 'package:pow/payment_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pow/billing_card.dart';
import 'package:pow/misc.dart';

class BillingMain extends StatefulWidget {
  @override
  _BillingMainState createState() => _BillingMainState();
}

class _BillingMainState extends State<BillingMain> {

  String searchQuery = '';

  void initiateSearch(String val) {
  setState(() {
      searchQuery = val.toLowerCase().trim();
  });
}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Menu.png'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
          ),
          title: Text('BILLING', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            GestureDetector(
              child: Image.asset('assets/Add.png'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMain())),
            )
          ],
        ),

        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 5),
              height: SizeConfig.blockSizeVertical * 10,
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6.0, offset: Offset(2.0, 5.0))
                  ]
                ),
                child: TextField(
                    onChanged: (value) => initiateSearch(value),
                    style: TextStyle(color: Color(0xff2699fb)),
                    autofocus: true,
                    cursorColor: Color(0xff2699fb),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 13, bottom: 13, left: 20, right: 20),
                      hintText: 'Search for customer name...',
                      hintStyle: TextStyle(color: Color(0xff2699fb), fontSize: 14),
                      border: InputBorder.none
                    ),
                  ),
                ),
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.all(14.0),
              color: Colors.white,
              child: StreamBuilder<QuerySnapshot>(
                stream: searchQuery != "" && searchQuery != null
              ? Firestore.instance
                  .collection('billings')
                  .where("searchIndex", arrayContains: searchQuery)
                  .snapshots()
              : Firestore.instance.collection("billings").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return LoadingCircle();
                    default:
                      return new ListView(
                        children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                            return new BillingCard(
                              // customerId: document.documentID,
                              billingId: document['billingId'],
                              firstName: document['firstName'],
                              lastName: document['lastName'],
                              phoneNumber: document['phoneNumber'],
                              paymentMethod: document['paymentMethod'],
                              amount: document['amount'],
                              paymentDate: document['paymentDate'],
                              reason: document['reason'],
                            );
                          }).toList(),
                      );
                  }
                },
              )
            )
            ),

          ],
        )
    );
  }
}