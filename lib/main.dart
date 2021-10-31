import 'package:flutter/material.dart';
import 'package:yorcab/Customer/End_Trip.dart';
import 'package:yorcab/Customer/Start_Trip.dart';
import 'package:yorcab/Driver/Driver_Login.dart';
import 'package:yorcab/Driver/Driver_SignUp.dart';
import 'package:yorcab/WelcomeScreen.dart';
import 'Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Login.id: (context) => Login(),
        Driver_Login.id: (context) => Driver_Login(),
        Driver_SignUp.id: (context) => Driver_SignUp(),
      },
    );
  }
}