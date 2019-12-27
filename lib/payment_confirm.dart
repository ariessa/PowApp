import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pow/payment_completed.dart';
import 'package:pow/misc.dart';

class PaymentConfirm extends StatefulWidget {

  PaymentConfirm(
    {
      @required
      this.firstName,
      this.lastName,
      this.paymentMethod,
      this.phoneNumber,
      this.amount,
      this.paymentDate,
      this.reason
    }
  );

  final firstName;
  final lastName;
  final paymentMethod;
  final phoneNumber;
  final amount;
  final paymentDate;
  final reason;

  @override
  _PaymentConfirmState createState() => _PaymentConfirmState(
    firstName, 
    lastName, 
    paymentMethod,
    phoneNumber,
    amount,
    paymentDate,
    reason);
}

class _PaymentConfirmState extends State<PaymentConfirm> {

  String _firstName;
  String _lastName;
  String _paymentMethod;
  String _phoneNumber;
  double _amount;
  String _paymentDate;
  String _reason;

  final db = Firestore.instance;

 _PaymentConfirmState(
   this._firstName, 
   this._lastName, 
   this._paymentMethod,
   this._phoneNumber,
   this._amount,
   this._paymentDate,
   this._reason);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Back.png'),
            onTap: () => Navigator.pop(context),
          ),
          title: Text('CONFIRM BILLING', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
      
        body: SingleChildScrollView(
          child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Timeline
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: ScreenProgress(ticks: 3),
              ),

              Card(
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
                            _firstName,
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
                            _lastName,
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
                            _paymentMethod,
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
                            _phoneNumber,
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
                            _amount.toString(),
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
                            _paymentDate,
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
                            _reason,
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
                          'CONFIRM',
                          style: TextStyle(color: Colors.white), 
                        ),
                        onPressed: () async {

                          String combinedName = _firstName + " " + _lastName;

                          List<String> splitList = combinedName.split(" ");
                          List<String> indexList = [];

                          for (int i = 0; i < splitList.length; i++) {
                            for (int y = 1; y < splitList[i].length + 1; y++) {
                            indexList.add(splitList[i].substring(0, y).toLowerCase());
                            }
                          }

                          await db.collection('billings').document().setData(
                            {
                              'amount': _amount,
                              'firstName': _firstName,
                              'lastName': _lastName,
                              'paymentDate': _paymentDate,
                              'paymentMethod': _paymentMethod,
                              'phoneNumber': _phoneNumber,
                              'reason': _reason,
                              'searchIndex': indexList,
                            }
                          );

                          db.collection('information').document('revenue').updateData(
                            {
                              "value": FieldValue.increment(_amount)
                            }
                          );

                          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentCompleted()));

                        },
                      ),
                    ),
                    
                  ],
                ),
              )
              
            ],
          ),
        )
    )
    );
  }
}


