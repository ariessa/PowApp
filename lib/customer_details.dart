import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'package:pow/customer_main.dart';
import 'package:pow/customer_edit.dart';
import 'package:pow/customer_deleted.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerDetails extends StatelessWidget {

  CustomerDetails(
    {
      @required
      this.documentId,
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

  final documentId;
  final firstName;
  final lastName;
  final gender;
  final icNumber;
  final phoneNumber;
  final addressI;
  final addressII;
  final addressIII;

  final db = Firestore.instance;

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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerMain())),
          ),
          title: Text('CUSTOMER', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)), 
                  ),
                  padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 30),
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
                          "NAME",
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
            Row(
              children: <Widget>[
                GestureDetector(
                    child: Container(
                      width: (SizeConfig.screenWidth-60)/2,
                      margin: EdgeInsets.only(top: 40, bottom: 40, right: 10, left: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff2699fb),
                        )),
                      child: Text(
                        "EDIT",
                        textAlign: TextAlign.center, 
                        style: TextStyle(
                          color: Color(0xff2699fb),
                        ),
                      ),
                    ),
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CustomerEdit(
                        documentId: documentId,
                        firstName: firstName,
                        lastName: lastName,
                        gender: gender,
                        icNumber: icNumber,
                        phoneNumber: phoneNumber,
                        addressI: addressI,
                        addressII: addressII,
                        addressIII: addressIII,
                    ),
                    )
                    ),
                    
                    
                    
                  ),
                  GestureDetector(
                    child: Container(
                      width: (SizeConfig.screenWidth-60)/2,
                      margin: EdgeInsets.only(right: 20, top: 40, bottom: 40),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Color(0xff2699fb)),
                      child: Text(
                        "DELETE",
                        textAlign: TextAlign.center, 
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    onTap: ()  async {
                      await db.collection('customers').document(documentId).delete();

                      db.collection('information').document('customers').updateData(
                        {
                          "value": FieldValue.increment(-1)
                        }
                      );

                      if (gender == "Male") {
                        db.collection('genders').document('male').updateData(
                          {
                            "taskVal": FieldValue.increment(-1)
                          }
                        );
                      }

                      else {
                        db.collection('genders').document('female').updateData(
                          {
                            "taskVal": FieldValue.increment(-1)
                          }
                        );
                      }


                      Navigator.push(context, MaterialPageRoute(
                    builder: (context) => CustomerDeleted()));
                    },
                  ),
              ],
            )
            
          ],
        ),
      )
        ),
      
    );
  }
}