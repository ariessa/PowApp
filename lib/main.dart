import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu.dart';
import 'login.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:pow/misc.dart';

Future main() async {
      runApp(
          ChangeNotifierProvider<AuthService>(
            child: MyApp(),
            create: (BuildContext context) {
              return AuthService();
            },
          ),
        );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pow',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<FirebaseUser>(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // log error to console 
            if (snapshot.error != null) { 
              print("error");
              return Text(snapshot.error.toString());
            }

            // redirect to the proper page
            return snapshot.hasData ? HomePage() : LoginPage();
          } else {
            // show loading indicator
            return LoadingCircle();
          }
        },
      ),
    );
  }
}