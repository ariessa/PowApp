import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pow/customer_added.dart';
import 'package:pow/misc.dart';

class CustomerAdd extends StatefulWidget {
  @override
  _CustomerAddState createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {

  final _formKey = GlobalKey<FormState>();
  final db = Firestore.instance;
  String _firstName;
  String _lastName;
  String _gender;
  String _icNumber;
  String _phoneNumber;
  String _addressI;
  String _addressII;
  String _addressIII;
  int radioValue = 0;

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
          title: Text('ADD CUSTOMER', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),

        body: SingleChildScrollView(
        // padding: EdgeInsets.all(10.0),
        child: Container(
            color: Colors.white,
            // padding: EdgeInsets.all(10.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  // SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _firstName = value,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      validator: (value) => value.isEmpty ? 'First Name is required' : null,
                      inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                      decoration: InputDecoration(
                        labelText: "First Name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),
                  // SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _lastName = value,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? 'Last Name is required' : null,
                      inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),
                  
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _icNumber= value,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      validator: (value) => value.isEmpty ? 'IC Number is required' : null,
                      inputFormatters: [
                                LengthLimitingTextInputFormatter(14),
                              ],
                      decoration: InputDecoration(
                        labelText: "IC Number",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),
                  // SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _phoneNumber = value,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      validator: (value) => value.isEmpty ? 'Phone Number is required' : null,
                      inputFormatters: [
                                LengthLimitingTextInputFormatter(12),
                              ],
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _addressI = value,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      validator: (value) => value.isEmpty ? 'Address Line I is required' : null,
                      inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                      decoration: InputDecoration(
                        labelText: "Address Line I",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),
                  // SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _addressII = value,
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? 'Address Line II is required' : null,
                      autofocus: true,
                      inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                      decoration: InputDecoration(
                        labelText: "Address Line II",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _addressIII = value,
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? 'Address Line III is required' : null,
                      autofocus: true,
                      inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                      ],
                      decoration: InputDecoration(
                        labelText: "Address Line III",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        
                        Column(
                        children: <Widget>[
                          
                          new RadioListTile<int>(
                              title: new Text('Male'),
                              value: 0,
                              groupValue: radioValue,
                              onChanged: (ind) => setState(() => radioValue = ind,),
                          ),
                          new RadioListTile<int>(
                              title: new Text('Female'),
                              value: 1,
                              groupValue: radioValue,
                              onChanged: (ind) => setState(() => radioValue = ind,),),
                        ],
                      ),
                      ],
                      
                    ),
                    
                  ),

                  



                  SizedBox(height: 20.0),
                  GestureDetector(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: const Color(0xff2699fb)),
                      child: Text("SUBMIT", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                    ),
                    onTap: () async {

                      if (radioValue == 0) {
                        _gender = "Male";
                      }
                      else {
                        _gender = "Female";
                      }
                      // save the fields..
                      final form = _formKey.currentState;


                      // Validate will return true if is valid, or false if invalid.
                      if (form.validate()) {
                        

                        form.save();

                        String combinedName = _firstName + " " + _lastName;

                        List<String> splitList = combinedName.split(" ");
                        List<String> indexList = [];

                        for (int i = 0; i < splitList.length; i++) {
                          for (int y = 1; y < splitList[i].length + 1; y++) {
                          indexList.add(splitList[i].substring(0, y).toLowerCase());
                          }
                        }
                        
                        await db.collection('customers').document().setData(
                        {
                          'firstName': _firstName,
                          'lastName': _lastName,
                          'gender': _gender,
                          'icNumber': _icNumber,
                          'phoneNumber': _phoneNumber,
                          'addressI': _addressI,
                          'addressII': _addressII,
                          'addressIII': _addressIII,
                          'searchIndex': indexList,
                        }

                    );

                    db.collection('information').document('customers').updateData(
                        {
                          "value": FieldValue.increment(1)
                        }
                      );

                    if (_gender == "Male") {
                      db.collection('genders').document('male').updateData(
                        {
                          "taskVal": FieldValue.increment(1)
                        }
                      );
                    }

                    else {
                      db.collection('genders').document('female').updateData(
                        {
                          "taskVal": FieldValue.increment(1)
                        }
                      );
                    }

                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => CustomerAdded(
                      
                    )));
                      } else {
                        _ErrorDialog(context);
                      }
                    },
                  ),
                ]
                )
                )
                ),
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