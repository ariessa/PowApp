import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'payment_customer_details.dart';

class PaymentCustomerCard extends StatelessWidget {
  
  PaymentCustomerCard(
    {
      @required 
      // this.customerId,
      this.firstName, 
      this.lastName,
      this.gender,
      this.icNumber,
      this.phoneNumber,
      this.addressI,
      this.addressII,
      this.addressIII
    });

  // final customerId;
  final firstName;
  final lastName;
  final gender;
  final icNumber;
  final phoneNumber;
  final addressI;
  final addressII;
  final addressIII;

  
  Widget build(BuildContext context) {
    String image = '';
    if (gender == 'Male') {
      image = 'assets/Boy.png';
    }
    else {
      image = 'assets/Girl.png';
    }
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PaymentCustomerDetails(
                      // customerId: customerId,
                      firstName: firstName, 
                      lastName: lastName,
                      gender: gender,
                      icNumber: icNumber,
                      phoneNumber: phoneNumber,
                      addressI: addressI,
                      addressII: addressII,
                      addressIII: addressIII,
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
              height: SizeConfig.blockSizeVertical * 18,
              image: AssetImage(image),
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
                    textScaleFactor: 1, 
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
                    textScaleFactor: 1, 
                    style: TextStyle(
                      color: Color(0xff2699fb), 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )

              ]
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: SizeConfig.blockSizeHorizontal * 20,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "NAME", 
                    textAlign: TextAlign.end,
                    textScaleFactor: 1, 
                    style: TextStyle(
                      color: Color(0xffbce0fd), 
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 20,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "    ",
                    textScaleFactor: 1,
                    textAlign: TextAlign.end
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