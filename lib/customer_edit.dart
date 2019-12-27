import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pow/customer_edited.dart';
import 'package:pow/misc.dart';

class CustomerEdit extends StatefulWidget {

  CustomerEdit(
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

  @override
  _CustomerEditState createState() => _CustomerEditState(documentId, firstName, lastName, gender, icNumber, phoneNumber, addressI, addressII, addressIII);
}

class _CustomerEditState extends State<CustomerEdit> {

  final _formKey = GlobalKey<FormState>();
  final db = Firestore.instance;
  String _documentId;
  String _firstName;
  String _lastName;
  String _gender;
  String _icNumber;
  String _phoneNumber;
  String _addressI;
  String _addressII;
  String _addressIII;
  int radioValue;

  _CustomerEditState(
      this._documentId,
      this._firstName,
      this._lastName,
      this._gender,
      this._icNumber,
      this._phoneNumber,
      this._addressI,
      this._addressII,
      this._addressIII
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (_gender == "Male") {
    radioValue = 0;
    }
    else {
      radioValue = 1;
    }
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Back.png'),
            onTap: () => Navigator.pop(context),
          ),
          title: Text('EDIT CUSTOMER', 
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
                      initialValue: _firstName,
                      onSaved: (value) => _firstName = value,
                      keyboardType: TextInputType.text,
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
                      initialValue: _lastName,
                      onSaved: (value) => _lastName = value,
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
                      initialValue: _icNumber,
                      onSaved: (value) => _icNumber= value,
                      keyboardType: TextInputType.number,
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
                      initialValue: _phoneNumber,
                      onSaved: (value) => _phoneNumber = value,
                      keyboardType: TextInputType.number,
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
                      initialValue: _addressI,
                      onSaved: (value) => _addressI = value,
                      keyboardType: TextInputType.text,
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
                      initialValue: _addressII,
                      onSaved: (value) => _addressII = value,
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? 'Address Line II is required' : null,
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
                      initialValue: _addressIII,
                      onSaved: (value) => _addressIII = value,
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? 'Address Line III is required' : null,
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
                        await db.collection('customers').document(_documentId).updateData({
                          'firstName': _firstName,
                          'lastName': _lastName,
                          'gender': _gender,
                          'icNumber': _icNumber,
                          'phoneNumber': _phoneNumber,
                          'addressI': _addressI,
                          'addressII': _addressII,
                          'addressIII': _addressIII,
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerEdited()));

                        if (_gender == "Male") {
                          db.collection('genders').document('male').updateData(
                            {
                              "taskVal": FieldValue.increment(-1)
                            }
                          );
                          db.collection('genders').document('female').updateData(
                            {
                              "taskVal": FieldValue.increment(-1)
                            }
                          );
                          db.collection('genders').document('male').updateData(
                            {
                              "taskVal": FieldValue.increment(1)
                            }
                          );
                        }

                        else {
                          db.collection('genders').document('male').updateData(
                            {
                              "taskVal": FieldValue.increment(-1)
                            }
                          );
                          db.collection('genders').document('female').updateData(
                            {
                              "taskVal": FieldValue.increment(-1)
                            }
                          );
                          db.collection('genders').document('female').updateData(
                            {
                              "taskVal": FieldValue.increment(1)
                            }
                          );
                        }

                      }
                      else {
                        _ErrorDialog(context);
                      }
                    }
                  )
                ]
            ),
        ),
        ),
        ),
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