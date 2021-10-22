import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yorcab/Constants.dart';
import 'package:yorcab/Customer/End_Trip.dart';
import 'package:yorcab/Customer/Start_Trip.dart';
import 'package:yorcab/Driver/Driver_Login.dart';
import 'package:yorcab/Driver/Driver_SignUp.dart';

class Login extends StatefulWidget {
  static const String id = 'Login Screen';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LogoColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35,top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: Hero(
                        tag: 'Logo',
                        child: Image(
                          image: AssetImage('Images/photo.png'),
                          height: 100, width: 100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Yor Cab    ",
                              style: TextStyle(
                                  fontFamily: 'Tushar',
                                  fontSize: 45,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                                "- A Taxi for Everyone",
                                 style: TextStyle(
                                   fontFamily: 'Tushar',
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold
                                 ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tushar',
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        'Driver\'s Area',
                        style: TextStyle(
                          color: LogoColor,
                          fontFamily: 'Tushar',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: RoundedButton(
                                  text: 'Sign Up',
                                  color: LogoColor,
                                  textColor: Colors.black,
                                  onPress: (){
                                    Navigator.pushNamed(context, Driver_SignUp.id);
                                  },
                              ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: RoundedButton(
                                text: 'Login',
                                color: LogoColor,
                                textColor: Colors.black,
                                onPress: (){
                                  Navigator.pushNamed(context, Driver_Login.id);
                                },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: LogoColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(left: 35.0),
                                child: Text(
                                  'Customer\'s Area',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Tushar',
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 30,right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: RoundedButton(
                                          text: 'Start Trip',
                                          color: Colors.black,
                                          textColor: LogoColor,
                                          onPress: (){
                                            Navigator.pushNamed(context, Start_Trip.id);
                                          },
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      flex: 1,
                                      child: RoundedButton(
                                          text: 'End Trip',
                                          color: Colors.black,
                                          textColor: LogoColor,
                                          onPress: (){
                                            Navigator.pushNamed(context, End_Trip.id);
                                          },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Expanded(
                                child: Container(
                                  color: Colors.black,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 5),
                                      Text(
                                        "~ Made With ♥    ",
                                        style: TextStyle(
                                          color: LogoColor,
                                          fontFamily: 'Tushar',
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w100,
                                          letterSpacing: 2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}