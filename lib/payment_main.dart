import 'package:flutter/material.dart';
import 'package:pow/billing_main.dart';
import 'package:pow/misc.dart';
import 'package:pow/payment_customer_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentMain extends StatefulWidget {
    @override
  _PaymentMainState createState() => _PaymentMainState();
}

class _PaymentMainState extends State<PaymentMain> {

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
            child: Image.asset('assets/Back.png'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BillingMain())),
          ),
          title: Text('ADD BILLING', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
      
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              // Timeline
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: ScreenProgress(ticks: 1),
              ),

              // Search bar
              Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 5),
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
              margin: EdgeInsets.all(14.0),
              // height: SizeConfig.blockSizeVertical * 30,
              // width: SizeConfig.screenWidth,
              color: Colors.white,
              child: StreamBuilder<QuerySnapshot>(
                stream: searchQuery != "" && searchQuery != null
              ? Firestore.instance
                  .collection('customers')
                  .where("searchIndex", arrayContains: searchQuery)
                  .snapshots()
              : Firestore.instance.collection("customers").snapshots(),
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
                            return new PaymentCustomerCard(
                              // customerId: document.documentID,
                              firstName: document['firstName'],
                              lastName: document['lastName'],
                              gender: document['gender'],
                              icNumber: document['icNumber'],
                              phoneNumber: document['phoneNumber'],
                              addressI: document['addressI'],
                              addressII: document['addressII'],
                              addressIII: document['addressIII'],
                            );
                          }).toList(),
                      );
                  }
                },
              )
            )
            ),
            ],
          ),
        )
    );
  }
}