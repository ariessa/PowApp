import 'package:flutter/material.dart';
import 'package:pow/inventory_edited.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pow/misc.dart';

class InventoryEdit extends StatefulWidget {

  InventoryEdit(
    {
      @required
      this.documentId,
      this.itemName,
      this.supplierName,
      this.pricePerItem,
      this.quantity,
    }
  );

  final documentId;
  final itemName;
  final supplierName;
  final pricePerItem;
  final quantity;


  @override
  _InventoryEditState createState() => _InventoryEditState(documentId, itemName, supplierName, pricePerItem, quantity);
}

class _InventoryEditState extends State<InventoryEdit> {

  String _documentId;
  String _itemName;
  String _supplierName;
  String _pricePerItem;
  String _quantity;
  final _formKey = GlobalKey<FormState>();
  final db = Firestore.instance;
  _InventoryEditState(this._documentId, this._itemName, this._supplierName, this._pricePerItem, this._quantity);

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
          title: Text('EDIT ITEM', 
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
                      onSaved: (value) => _itemName = value,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      initialValue: _itemName,
                      validator: (value) => value.isEmpty ? 'Item Name is required' : null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      decoration: InputDecoration(
                        labelText: "Item Name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onSaved: (value) => _supplierName = value,
                      initialValue: _supplierName,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? 'Supplier Name is required' : null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      decoration: InputDecoration(
                        labelText: "Supplier Name",
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
                      onSaved: (value) => _pricePerItem= value,
                      keyboardType: TextInputType.number,
                      initialValue: _pricePerItem,
                      autofocus: true,
                      validator: (value) => value.isEmpty ? 'Price Per Item (RM) is required' : null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        labelText: "Price Per Item (RM)",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
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
                      onSaved: (value) => _quantity = value,
                      keyboardType: TextInputType.number,
                      initialValue: _quantity,
                      autofocus: true,
                      validator: (value) => value.isEmpty ? 'Quantity is required' : null,
                      inputFormatters: [
                                LengthLimitingTextInputFormatter(12),
                              ],
                      decoration: InputDecoration(
                        labelText: "Quantity",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                          ),
                        ),
                      )
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
                      final form = _formKey.currentState;

                      if (form.validate()) {
                        
                        form.save();

                        List<String> splitList = _itemName.split(" ");
                        List<String> indexList = [];

                        for (int i = 0; i < splitList.length; i++) {
                          for (int y = 1; y < splitList[i].length + 1; y++) {
                          indexList.add(splitList[i].substring(0, y).toLowerCase());
                          }
                        }
                        
                        await db.collection('inventory').document(_documentId).updateData(
                        {
                          'itemName': _itemName,
                          'supplierName': _supplierName,
                          'pricePerItem': _pricePerItem,
                          'quantity': _quantity, 
                          'searchIndex': indexList,
                        }
                    );

                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => InventoryEdited(
                      
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