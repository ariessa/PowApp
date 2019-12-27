import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'package:pow/payment_details.dart';

class PaymentCustomerDetails extends StatelessWidget {

  PaymentCustomerDetails(
    {
      @required
      this.firstName,
      this.lastName,
      this.gender,
      this.icNumber,
      this.phoneNumber,
      this.addressI,
      this.addressII,
      this.addressIII
    }
  );

  final firstName;
  final lastName;
  final gender;
  final icNumber;
  final phoneNumber;
  final addressI;
  final addressII;
  final addressIII;

  @override
  Widget build(BuildContext context) {
    String image = '';
    if (gender == 'Male') {
      image = 'assets/Boy.png';
    }
    else {
      image = 'assets/Girl.png';
    }
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Back.png'),
            onTap: () => Navigator.pop(context),
          ),
          title: Text('SELECT CUSTOMER', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Card(
        margin: EdgeInsets.only(top: 40, bottom: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)), 
                  ),
                  padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 15),
                  child: Image(
                    width: SizeConfig.blockSizeHorizontal * 28,
                    // height: SizeConfig.blockSizeVertical * 20,
                    fit: BoxFit.cover,
                  image: AssetImage(image),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "CUSTOMER NAME",
                          textScaleFactor: 1, 
                          style: TextStyle(
                            color: Color(0xffbce0fd),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          firstName,
                          textScaleFactor: 1.5, 
                          style: TextStyle(
                            color: Color(0xff2699fb),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          lastName,
                          textScaleFactor: 1.5, 
                          style: TextStyle(
                            color: Color(0xff2699fb),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ) 
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 5,),
                  child: Text(
                    "GENDER",
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
                    gender,
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
                    "IC NUMBER",
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
                    icNumber,
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
                    "ADDRESS I",
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
                    addressI,
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
                    "ADDRESS II",
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
                    addressII,
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
                    "ADDRESS III",
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
                    addressIII,
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
                  'SELECT',
                  style: TextStyle(color: Colors.white), 
                ),
                onPressed: () => Navigator.push(context, 
                MaterialPageRoute(builder: (context) => PaymentDetails(
                  firstName: firstName,
                  lastName: lastName,
                  phoneNumber: phoneNumber,
                ))),
              ),
            ),
            
          ],
        ),
      )
        ),
      ), 
    );
  }
}