import 'package:flutter/material.dart';
import 'package:pow/dashboard_revenue_card.dart';
import 'package:pow/dashboard_customers_card.dart';
import 'package:pow/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pow/misc.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardMain extends StatefulWidget {
  @override
  _DashboardMainState createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {

  List<charts.Series<Task, String>> _seriesPieData;
  List<Task> mydata;
  _generateData(mydata) {
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.taskDetails,
        measureFn: (Task task, _) => task.taskVal,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(task.colorVal))),
        id: 'task',
        data: mydata,
        labelAccessorFn: (Task row, _) => "${row.taskVal}",
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Menu.png'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
          ),
          title: Text('DASHBOARD', 
            style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),

      body: SingleChildScrollView(
         child: Container(
         color: Colors.white,
         width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child: StreamBuilder(
                  stream: Firestore.instance.collection('information').document('revenue').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new LoadingCircle();
                    }
                    return new DashboardRevenueCard(
                      totalRevenue: snapshot.data['value'],
                    );
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: StreamBuilder(
                  stream: Firestore.instance.collection('information').document('customers').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new LoadingCircle();
                    }
                    return new DashboardCustomersCard(
                      totalCustomers: snapshot.data['value'],
                    );
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20,),
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('genders').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LinearProgressIndicator();
                    } else {
                      List<Task> task = snapshot.data.documents
                          .map((documentSnapshot) => Task.fromMap(documentSnapshot.data))
                          .toList();
                      return _buildChart(context, task);
                    }
                  },
                ),
              ),
              
            ],
          ), 
       )
      ),
       
        
    );
  }

  Widget _buildChart(BuildContext context, List<Task> taskdata) {
    mydata = taskdata;
    _generateData(mydata);
    return Container(
        height: 400,
        width: double.infinity,
        child: Card(
          child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'CUSTOMERS BY GENDER',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
              
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 5),
                    behaviors: [
                      new charts.DatumLegend(
                        outsideJustification:
                            charts.OutsideJustification.startDrawArea,
                        position:
                            charts.BehaviorPosition.bottom,
                        horizontalFirst: false,
                        desiredMaxRows: 1,
                        cellPadding:
                            new EdgeInsets.only(right: 20.0, left: 4.0, bottom: 20, top:4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.ColorUtil.fromDartColor(Colors.black),
                            fontFamily: 'Arial',
                            fontSize: 14,
                            // fontWeight: 6.toString(),
                        )
                      )
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Task {
  final int taskVal;
  final String taskDetails;
  final String colorVal;
  Task(this.taskDetails,this.taskVal,this.colorVal);

  Task.fromMap(Map<String, dynamic> map)
      : assert(map['taskDetails'] != null),
        assert(map['taskVal'] != null),
        assert(map['colorVal'] != null),
        taskDetails = map['taskDetails'].toString().toUpperCase(),
        taskVal = map['taskVal'],
        colorVal=map['colorVal'];

  @override
  String toString() => "Record<$taskVal:$taskDetails>";
}