import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'package:pow/billing_main.dart';

class PaymentCompleted extends StatefulWidget {

  @override
  _PaymentCompletedState createState() => _PaymentCompletedState();
}

class _PaymentCompletedState extends State<PaymentCompleted> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('BILLING COMPLETED', 
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
                child: ScreenProgress(ticks: 4),
              ),

              Card(
                margin: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(60),
                      width: double.infinity,
                      child: Image(
                        image: AssetImage('assets/Checkbox.png'),
                        alignment: Alignment.center,
                        height: 80,
                        width: 80
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
                      child: Text(
                        "You have added new billing !",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Color(0xff2699fb),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                  ],
                ),
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
                        onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => BillingMain()
                            )
                          ),
                      ),
                        
                    ),
            ],
          ),
        )
    )
    );
  }
}


