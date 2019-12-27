import 'package:flutter/material.dart';
import 'package:pow/inventory_edit.dart';
import 'package:pow/inventory_main.dart';
import 'package:pow/misc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pow/inventory_deleted.dart';

class InventoryDetails extends StatelessWidget {

  InventoryDetails(
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
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Back.png'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryMain())),
          ),
          title: Text('ITEM', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),

        body: Container(
           width: SizeConfig.screenWidth,
          height: double.infinity,
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
                  padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: Image(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    // height: SizeConfig.blockSizeVertical * 20,
                    fit: BoxFit.cover,
                  image: AssetImage('assets/Box.png'),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "ITEM NAME",
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
                          itemName,
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
                    "SUPPLIER NAME",
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
                    supplierName,
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
                    "PRICE PER ITEM (RM)",
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
                    pricePerItem,
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
                    "QUANTITY",
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
                    quantity,
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
                      margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
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
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryEdit(
                      documentId: documentId,
                      itemName: itemName,
                      supplierName: supplierName,
                      pricePerItem: pricePerItem,
                      quantity: quantity,
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
                      await db.collection('inventory').document(documentId).delete();
                      Navigator.push(context, MaterialPageRoute(
                    builder: (context) => InventoryDeleted()));
                    },
                  ),
              ],
            )
            
          ],
        ),
        ),
    );
  }
}