import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yorcab/Driver/Driver_Login.dart';
import 'package:yorcab/Driver/Driver_SignUp.dart';
import 'package:yorcab/WelcomeScreen.dart';
import 'Login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
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