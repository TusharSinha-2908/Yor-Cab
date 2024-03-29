import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yorcab/Constants.dart';
import 'package:yorcab/Customer/Driver_Details.dart';
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

  late ScanResult startTrip;
  late ScanResult endTrip;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Scaffold(
          backgroundColor: LogoColor,
          body: Column(
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
                                "Yor Cab  ",
                                style: TextStyle(
                                    fontFamily: 'Tushar',
                                    fontSize: 34,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                  " - A Taxi for Everyone",
                                   style: TextStyle(
                                     fontFamily: 'Tushar',
                                     fontSize: 12,
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
              SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Tushar',
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Text(
                            'Driver\'s Area',
                            style: TextStyle(
                              color: LogoColor,
                              fontFamily: 'Tushar',
                              fontSize: 20,
                            ),
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
                                    fontSize: 11,
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
                                  fontSize: 11,
                                  onPress: (){
                                    Navigator.pushNamed(context, Driver_Login.id);
                                  },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: LogoColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35.0),
                                  child: Text(
                                    'Customer\'s Area',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Tushar',
                                      fontSize: 20,
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
                                            fontSize: 11,
                                            onPress: () async{

                                              setState(() {
                                                spinner = true;
                                              });

                                              ScanResult code = await BarcodeScanner.scan();

                                              if(code.rawContent.isEmpty){
                                                showAlertDialogQR(context);
                                              }
                                              else if(code.rawContent.toString().contains("YorCab") == false)
                                              {
                                                showAlertDialogWrongQR(context);
                                              }
                                              else {
                                                setState(() {
                                                  startTrip = code;
                                                });

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context)=> Start_Trip(scanResult: startTrip)));
                                              }

                                              setState(() {
                                                spinner = false;
                                              });
                                            },
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        flex: 1,
                                        child: RoundedButton(
                                            text: 'Driver Details',
                                            color: Colors.black,
                                            textColor: LogoColor,
                                            fontSize: 11,
                                            onPress: () async{

                                              setState(() {
                                                spinner = true;
                                              });

                                              ScanResult code = await BarcodeScanner.scan();

                                              if(code.rawContent.isEmpty){
                                                showAlertDialogQR(context);
                                              }
                                              else if(code.rawContent.toString().contains("YorCab") == false)
                                              {
                                                showAlertDialogWrongQR(context);
                                              }
                                              else {
                                                  setState(() {
                                                    endTrip = code;
                                                  });

                                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Driver_Details(scanResult: endTrip)));
                                                }

                                              setState(() { spinner = false; });

                                              },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                              ],
                            ),
                          )
                      ),
                      Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "~ Made With ♥   ",
                              style: TextStyle(
                                  color: LogoColor,
                                  fontFamily: 'Tushar',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 8,
                                  letterSpacing: 2
                              ),
                            ),
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
      ),
    );
  }
}
