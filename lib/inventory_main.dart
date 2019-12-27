import 'package:flutter/material.dart';
import 'package:pow/inventory_add.dart';
import 'package:pow/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pow/inventory_card.dart';
import 'package:pow/misc.dart';

class InventoryMain extends StatefulWidget {
  @override
  _InventoryMainState createState() => _InventoryMainState();
}

class _InventoryMainState extends State<InventoryMain> {

  String searchQuery = '';

  void initiateSearch(String val) {
    setState(() {
      searchQuery = val.toLowerCase().trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Menu.png'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
          ),
          title: Text('INVENTORY', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            GestureDetector(
              child: Image.asset('assets/Add.png'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryAdd())),
            )
          ],
        ),

        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 5),
              height: SizeConfig.blockSizeVertical * 10,
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6.0, offset: Offset(2.0, 5.0))
                  ]
                ),
                child: TextField(
                    onChanged: (value) => initiateSearch(value),
                    style: TextStyle(color: Color(0xff2699fb)),
                    autofocus: true,
                    cursorColor: Color(0xff2699fb),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 13, bottom: 13, left: 20, right: 20),
                      hintText: 'Search for item name...',
                      hintStyle: TextStyle(color: Color(0xff2699fb), fontSize: 14),
                      border: InputBorder.none
                    ),
                  ),
                ),
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.all(14.0),
              color: Colors.white,
              child: StreamBuilder<QuerySnapshot>(
                stream: searchQuery != "" && searchQuery != null
              ? Firestore.instance
                  .collection('inventory')
                  .where("searchIndex", arrayContains: searchQuery)
                  .snapshots()
              : Firestore.instance.collection("inventory").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return LoadingCircle();
                    default:
                      return new ListView(
                        children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                            return new InventoryCard(
                              documentId: document.documentID,
                              itemName: document['itemName'],
                              supplierName: document['supplierName'],
                              pricePerItem: document['pricePerItem'],
                              quantity: document['quantity'],
                            );
                          }).toList(),
                      );
                  }
                },
              )
            )
            ),

          ],
        )
    );
  }
}