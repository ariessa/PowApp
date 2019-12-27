import 'package:flutter/material.dart';
import 'package:pow/misc.dart';
import 'inventory_details.dart';

class InventoryCard extends StatelessWidget {
  
  InventoryCard(
    {
      @required 
      // this.customerId,
      this.documentId,
      this.itemName,
      this.supplierName,
      this.pricePerItem,
      this.quantity,
    });

  // final customerId;
  final documentId;
  final itemName;
  final supplierName;
  final pricePerItem;
  final quantity;

  
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => InventoryDetails(
                      documentId: documentId,
                      itemName: itemName,
                      supplierName: supplierName,
                      pricePerItem: pricePerItem,
                      quantity: quantity,
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
              image: AssetImage('assets/Box.png'),
            ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: SizeConfig.blockSizeHorizontal * 30,
                  padding: EdgeInsets.only(top: 2, bottom: 5, right: 10),
                  child: Text(
                    itemName.toString().toUpperCase(), 
                    textAlign: TextAlign.start,
                    textScaleFactor: 0.9,
                    style: TextStyle(
                      color: Color(0xff2699fb), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 30,
                  padding: EdgeInsets.only(top: 16, bottom: 5, right: 10),
                  child: Text(
                    supplierName.toString().toUpperCase(), 
                    textAlign: TextAlign.start,
                    textScaleFactor: 0.9, 
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
                    "ITEM", 
                    textAlign: TextAlign.end,
                    textScaleFactor: 1, 
                    style: TextStyle(
                      color: Color(0xffbce0fd), 
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 30,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "SUPPLIER",
                    textScaleFactor: 1,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xffbce0fd), 
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ],
            )
          ],
        )
      )
      )
    );
  }
}