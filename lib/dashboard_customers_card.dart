import 'package:flutter/material.dart';

class DashboardCustomersCard extends StatelessWidget {
  
  DashboardCustomersCard(
    {
      this.totalCustomers
    });

  final totalCustomers;

  
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Color(0xfff1f9ff),
        child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              "TOTAL CUSTOMERS",
              textScaleFactor: 1,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 20,),
            Text(
              totalCustomers.toString(),
              textScaleFactor: 3,
              style: TextStyle(
                color: Colors.black,
              )
            ), 
          ],
        )
      )
    )
  );
  }
}