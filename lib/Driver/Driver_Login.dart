import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yorcab/Constants.dart';
import 'package:yorcab/Driver/Driver_QR.dart';

class Driver_Login extends StatefulWidget {
  static const String id = "Driver Login Screen";

  const Driver_Login({Key? key}) : super(key: key);

  @override
  _Driver_LoginState createState() => _Driver_LoginState();
}

class _Driver_LoginState extends State<Driver_Login> {

  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _emailValidate = false;
  bool _passwordValidate = false;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  fontSize: 15
              ),
            ),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Hero(
                          tag: 'Logo',
                          child: Image(
                            image: AssetImage('Images/photo.png'),
                            height: 135, width: 135,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 30),
                child: Container(
                  child: Text(
                    " Enter Credentials",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Tushar',
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Text(
                      " E-mail : ",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Tushar'
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: TextField(
                          controller: _email,
                          style: TextStyle(fontFamily: 'Tushar', fontSize: 11),
                          keyboardType: TextInputType.emailAddress,
                          keyboardAppearance: Brightness.dark,
                          textAlign: TextAlign.center,
                          decoration: textBox.copyWith(hintText: 'E-Mail ID').copyWith(errorText: _emailValidate ? '\t\t\t\t\t\t\t\t\t\t\t\t  E-Mail Required' : null),
                          onChanged: (value){
                            setState(() {
                              _email.text.isEmpty ? _emailValidate = true : _emailValidate = false;
                              email = _email.text;
                            });
                          },
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
                          fontSize: 13,
                          fontFamily: 'Tushar'
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: TextField(
                          obscureText: true,
                          controller: _password,
                          style: TextStyle(fontFamily: 'Tushar', fontSize: 12),
                          keyboardType: TextInputType.text,
                          keyboardAppearance: Brightness.dark,
                          textAlign: TextAlign.center,
                          decoration: textBox.copyWith(hintText: 'Password').copyWith(errorText: _passwordValidate ? '\t\t\t\t\t\t\t\t\t\t\t\t  Password Required' : null),
                          onChanged: (value){
                            setState(() {
                              _password.text.isEmpty ? _passwordValidate = true : _passwordValidate = false;
                              password = _password.text;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 110,right: 110),
                  child: RoundedButton(
                    text: 'Submit',
                    color: Colors.black,
                    textColor: LogoColor,
                    fontSize: 12,
                    onPress: () async {

                      setState(() {
                        spinner = true;
                      });

                      if(_emailValidate || _passwordValidate)
                      { showAlertDialog(context); }

                      else if(password!.length < 6)
                      { showAlertDialogPassword(context); }

                      else {
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email!,
                              password: password!);

                          if (user != null) {
                            Navigator.popAndPushNamed(context, Driver_QR.id);
                          }
                          else showAlertDialogLogin(context);
                        } catch (e) {
                          print(e);
                          showAlertDialogLogin(context);
                        }
                      }

                      setState(() {
                        spinner = false;
                      });

                    },
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
