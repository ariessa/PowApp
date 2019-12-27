import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'package:pow/payment_confirm.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PaymentDetails extends StatefulWidget {

  PaymentDetails(
    {
      @required
      this.firstName,
      this.lastName,
      // this.paymentMethod,
      this.phoneNumber,
      // this.amount,
      // this.paymentDate,
      // this.reason
    }
  );

  final firstName;
  final lastName;
  // final paymentMethod;
  final phoneNumber;
  // final amount;
  // final paymentDate;
  // final reason;

    @override
  _PaymentDetailsState createState() => _PaymentDetailsState(firstName, lastName, phoneNumber);
}


class _PaymentDetailsState extends State<PaymentDetails> {

  String _firstName;
  String _lastName;
  String _phoneNumber;
 _PaymentDetailsState(this._firstName, this._lastName, this._phoneNumber); 
  final _formKey = GlobalKey<FormState>();
  List<String> _paymentMethods = <String>['Cash', 'Online Payment', 'Debit / Credit Card'];
  String _paymentMethod = 'Cash';
  double _amount;
  String _paymentDate;
  String _reason;

  
  final TextEditingController _controller = new TextEditingController();
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
      _paymentDate = _controller.text;
    });
  }

  DateTime convertToDate(String input) {
    try 
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }    
  }

bool isValidDob(String dob) {
    if (dob.isNotEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
}  

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
          title: Text('BILLING DETAILS', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
      
        body: SingleChildScrollView(
          child: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            autovalidate: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Timeline
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: ScreenProgress(ticks: 2),
              ),

              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  "Payment Method",
                  style: TextStyle(color: Color(0xff2699fb), fontWeight: FontWeight.bold
                  ),
                  textScaleFactor: 0.9,
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        // icon: const Icon(Icons.color_lens),
                      ),
                      // isEmpty: _color == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          value: _paymentMethod,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {

                              _paymentMethod = newValue.toString();
                              state.didChange(newValue);
                            });
                          },
                          items: _paymentMethods.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value.toString(),
                              child: new Text(value.toString()),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  "Amount (RM)",
                  style: TextStyle(color: Color(0xff2699fb), fontWeight: FontWeight.bold
                  ),
                  textScaleFactor: 0.9,
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: TextFormField(
                  onSaved: (value) => _amount = double.parse(value),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(8),
                  ],
                  keyboardType: TextInputType.number,
                  validator: (val) => val.isEmpty ? 'Amount is required' : null,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  "Date",
                  style: TextStyle(color: Color(0xff2699fb), fontWeight: FontWeight.bold
                  ),
                  textScaleFactor: 0.9,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(children: <Widget>[
                  new Expanded(
                    child: new TextFormField(
                      decoration: new InputDecoration(
                      ),
                      controller: _controller,
                      onTap: () => {
                        SystemChannels.textInput.invokeMethod('TextInput.hide'),
                        _chooseDate(context, "")},
                      validator: (val) => isValidDob(val) ? null : 'Date is invalid',
                      onSaved: (value) => _paymentDate = value.toString(),
                    )
                  ),
                  new IconButton(
                    icon: new Icon(Icons.calendar_today),
                    tooltip: 'Choose date',
                    onPressed: (() {
                      _chooseDate(context, _controller.text);
                    }),
                  ),
                ]),
              ),

              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  "Reason",
                  style: TextStyle(color: Color(0xff2699fb), fontWeight: FontWeight.bold
                  ),
                  textScaleFactor: 0.9,
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
                child: TextFormField(
                  onSaved: (value) => _reason = value.toString(),
                  
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(25),
                  ],
                  validator: (val) => val.isEmpty ? 'Reason is required' : null,
                ),
              ),

              Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
              width: double.infinity,
              height: SizeConfig.blockSizeVertical * 6,
              child: RaisedButton(
                color: Color(0xff2699fb),
                child: Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white), 
                ),
                onPressed: () async { 

                  final FormState form = _formKey.currentState;

                  if (!form.validate()) {
                    _ErrorDialog(context);
                  } else {
                    form.save(); //This invokes each onSaved event

                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PaymentConfirm(
                      firstName: _firstName,
                      lastName: _lastName,
                      paymentMethod: _paymentMethod,
                      phoneNumber: _phoneNumber,
                      amount: _amount,
                      paymentDate: _paymentDate,
                      reason: _reason,
                    )));
                  }

                  
                }
              ),
            ),
            ],
          ),
        )
    )
    )
    );
  }
}

Future _ErrorDialog(BuildContext context) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Invalid Form'),
          content: Text("All details are required to submit the form"),
          actions: <Widget>[
            FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
