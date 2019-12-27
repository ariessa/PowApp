import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'package:pow/billing_main.dart';

class BillingDetails extends StatelessWidget {

  BillingDetails(
    {
      @required
      // this.customerId,
      this.billingId,
      this.firstName, 
      this.lastName,
      this.icNumber,
      this.phoneNumber,
      this.paymentMethod,
      this.amount,
      this.paymentDate,
      this.reason
    }
  );

  // final customerId;
  final billingId;
  final firstName;
  final lastName;
  final icNumber;
  final phoneNumber;
  final paymentMethod;
  final amount;
  final paymentDate;
  final reason;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xfff1f9ff),
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Card(
                margin: EdgeInsets.only(top: 40, bottom: 40, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                          child: Text(
                            "RECEIPT FOR",
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              color: Color(0xffbce0fd),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 5,),
                          child: Text(
                            firstName,
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 15,),
                          child: Text(
                            lastName,
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 5,),
                          child: Text(
                            "PAYMENT METHOD",
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              color: Color(0xffbce0fd),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 15,),
                          child: Text(
                            paymentMethod,
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 5,),
                          child: Text(
                            "PHONE NUMBER",
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              color: Color(0xffbce0fd),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 15,),
                          child: Text(
                            phoneNumber,
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 5,),
                          child: Text(
                            "AMOUNT (RM)",
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              color: Color(0xffbce0fd),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 15,),
                          child: Text(
                            amount.toString(),
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 5,),
                          child: Text(
                            "PAYMENT DATE",
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              color: Color(0xffbce0fd),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 15,),
                          child: Text(
                            paymentDate.toString(),
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 5,),
                          child: Text(
                            "REASON",
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              color: Color(0xffbce0fd),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 30,),
                          child: Text(
                            reason,
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),

                        
                      ],
                    )
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                      width: double.infinity,
                      height: SizeConfig.blockSizeVertical * 6,
                      // color: Color(0xff2699fb),
                      child: RaisedButton(
                        color: Color(0xff2699fb),
                        child: Text(
                          'CLOSE',
                          style: TextStyle(color: Colors.white), 
                        ),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BillingMain())),
                      ),
                    ),
                    
                  ],
                ),
              )
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}