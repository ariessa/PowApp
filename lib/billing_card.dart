import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'package:pow/billing_details.dart';

class BillingCard extends StatelessWidget {
  
  BillingCard(
    {
      @required 
      // this.customerId,
      this.billingId,
      this.firstName, 
      this.lastName,
      this.phoneNumber,
      this.paymentMethod,
      this.amount,
      this.paymentDate,
      this.reason
    });

  // final customerId;
  final billingId;
  final firstName;
  final lastName;
  final phoneNumber;
  final paymentMethod;
  final amount;
  final paymentDate;
  final reason;

  
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BillingDetails(
                      // customerId: customerId,
                      billingId: billingId,
                      firstName: firstName, 
                      lastName: lastName,
                      phoneNumber: phoneNumber,
                      paymentMethod: paymentMethod,
                      amount: amount,
                      paymentDate: paymentDate,
                      reason: reason,
                      )
                    )
        ),
        child: Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)), 
              ),
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Image(
              width: SizeConfig.blockSizeHorizontal * 18,
              height: SizeConfig.blockSizeVertical * 8,
              image: AssetImage('assets/Money.png'),
            ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: SizeConfig.blockSizeHorizontal * 30,
                  padding: EdgeInsets.only(top: 2, bottom: 5, left: 10, right: 10),
                  child: Text(
                    firstName.toString().toUpperCase(), 
                    textAlign: TextAlign.start,
                    textScaleFactor: 0.9, 
                    style: TextStyle(
                      color: Color(0xff2699fb), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 30,
                  padding: EdgeInsets.only(top: 8, bottom: 5, left: 10, right: 10),
                  child: Text(
                    lastName.toString().toUpperCase(), 
                    textAlign: TextAlign.start,
                    textScaleFactor: 0.9, 
                    style: TextStyle(
                      color: Color(0xff2699fb), 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 30,
                  padding: EdgeInsets.only(top: 8, bottom: 5, left: 10, right: 10),
                  child: Text(
                    paymentDate.toString().toUpperCase(), 
                    textAlign: TextAlign.start,
                    textScaleFactor: 0.9, 
                    style: TextStyle(
                      color: Color(0xff2699fb), 
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                )

              ]
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: SizeConfig.blockSizeHorizontal * 30,
                  padding: EdgeInsets.only(top: 2, bottom: 5, left: 10, right: 10),
                  child: Text(
                    "FIRST NAME", 
                    textAlign: TextAlign.end,
                    textScaleFactor: 0.8, 
                    style: TextStyle(
                      color: Color(0xffbce0fd), 
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 30,
                  padding: EdgeInsets.only(top: 8, bottom: 5, left: 10, right: 10),
                  child: Text(
                    "LAST NAME",
                    textScaleFactor: 0.8,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xffbce0fd), 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 20,
                  padding: EdgeInsets.only(top: 8, bottom: 5, left: 10, right: 10),
                  child: Text(
                    "DATE",
                    textScaleFactor: 0.8,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xffbce0fd), 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        )
      )
      )
    );
  }
}