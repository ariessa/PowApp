import 'package:flutter/material.dart';

class DashboardRevenueCard extends StatelessWidget {
  
  DashboardRevenueCard(
    {
      this.totalRevenue
    });

  final totalRevenue;

  
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Color(0xff7fc4fd),
        child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              "TOTAL REVENUE (RM)",
              textScaleFactor: 1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 20,),
            Text(
                  totalRevenue.toString(),
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  )
                ),
          ],
        )
      )
    )
  );
  }
}