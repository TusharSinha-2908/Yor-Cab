import 'package:flutter/material.dart';
import 'package:yorcab/Constants.dart';

class Driver_Login extends StatefulWidget {
  static const String id = "Driver Login Screen";

  const Driver_Login({Key? key}) : super(key: key);

  @override
  _Driver_LoginState createState() => _Driver_LoginState();
}

class _Driver_LoginState extends State<Driver_Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LogoColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: LogoColor,
        centerTitle: true,
        title: Title(
          color: Colors.black,
          child: Text(
            'Driver Log-In',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Tushar',
                fontSize: 23
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,right: 10,left: 10,bottom: 30),
            child: Container(
              child: Text(
                " Enter Credentials ",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Tushar',
                    color: Colors.black
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Row(
              children: [
                Text(
                  " E-mail :     ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Tushar'
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: textBox.copyWith(hintText: 'E-Mail ID'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 40),
            child: Row(
              children: [
                Text(
                  " Password : ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Tushar'
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: textBox.copyWith(hintText: 'Password'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: RoundedButton(
              text: 'Submit',
              color: Colors.black,
              textColor: LogoColor,
              fontSize: 15,
              onPress: ()=>{},
            ),
          ),
        ],
      ),
    );
  }
}
