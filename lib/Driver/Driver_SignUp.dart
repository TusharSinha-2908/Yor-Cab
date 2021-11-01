import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yorcab/Constants.dart';

class Driver_SignUp extends StatefulWidget {
  static const String id = "Driver SignUp Screen";

  const Driver_SignUp({Key? key}) : super(key: key);

  @override
  _Driver_SignUpState createState() => _Driver_SignUpState();
}

class _Driver_SignUpState extends State<Driver_SignUp> {

  final _auth = FirebaseAuth.instance;
  String? name;
  int? age;
  String? gender;
  int? phone;
  String? dl;
  String? email;
  String? password;

  final _name = TextEditingController();
  final _age = TextEditingController();
  final _gender = TextEditingController();
  final _phone = TextEditingController();
  final _dl = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _nameValidate = false;
  bool _ageValidate = false;
  bool _genderValidate = false;
  bool _phoneValidate = false;
  bool _dlValidate = false;
  bool _emailValidate = false;
  bool _passwordValidate = false;

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _gender.dispose();
    _phone.dispose();
    _dl.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
            'Driver Sign-Up',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Tushar',
                fontSize: 23
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,right: 10,left: 10,bottom: 40),
            child: Container(
              child: Text(
                  " Enter Details ",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Tushar',
                    color: Colors.black
                  ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  " Name :      ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Tushar'
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _name,
                    style: TextStyle(fontFamily: 'Tushar'),
                    keyboardType: TextInputType.name,
                    keyboardAppearance: Brightness.dark,
                    textAlign: TextAlign.center,
                    decoration: textBox.copyWith(hintText: 'Name').copyWith(errorText: _nameValidate ? '\t\t\t\t\t\t\t\t\t\t\t\t   Name Required' : null),
                    onChanged: (value){
                      setState(() {
                        _name.text.isEmpty ? _nameValidate = true : _nameValidate = false;
                        name = _name.text;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Row(
              children: [
                Text(
                  " Age :          ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Tushar'
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextField(
                      controller: _age,
                      style: TextStyle(fontFamily: 'Tushar'),
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: textBox.copyWith(hintText: 'Age').copyWith(errorText: _ageValidate ? '   Age' : null),
                      onChanged: (value){
                        setState(() {
                          _age.text.isEmpty ? _ageValidate = true : _ageValidate = false;
                          age = int.parse(_age.text);
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  "  Gender :  ",
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
                      controller: _gender,
                      style: TextStyle(fontFamily: 'Tushar'),
                      keyboardType: TextInputType.text,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: textBox.copyWith(hintText: 'M/F').copyWith(errorText: _genderValidate ? 'Gender' : null),
                      onChanged: (value){
                        setState(() {
                          _gender.text.isEmpty ? _genderValidate = true : _genderValidate = false;
                          gender = _gender.text.substring(0,1);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Row(
              children: [
                Text(
                  " Phone :      ",
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
                      controller: _phone,
                      style: TextStyle(fontFamily: 'Tushar'),
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: textBox.copyWith(hintText: 'Phone No.').copyWith(errorText: _phoneValidate ? '\t\t\t\t\t\t\t\t\t\t\t   Phone No. Required' : null),
                      onChanged: (value){
                        setState(() {
                          _phone.text.isEmpty ? _phoneValidate = true : _phoneValidate = false;
                          phone = int.parse(_phone.text);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Row(
              children: [
                Text(
                  " DL No. :     ",
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
                      controller: _dl,
                      style: TextStyle(fontFamily: 'Tushar'),
                      keyboardType: TextInputType.text,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: textBox.copyWith(hintText: 'Driving License No.').copyWith(errorText: _dlValidate ? '\t\t\t\t\t\t\t\t\t\t\t\t   DL No. Required' : null),
                      onChanged: (value){
                        setState(() {
                          _dl.text.isEmpty ? _dlValidate = true : _dlValidate = false;
                          dl = _dl.text;
                        });
                      },
                    ),
                  ),
                ),
              ],
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
                      controller: _email,
                      style: TextStyle(fontFamily: 'Tushar'),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: textBox.copyWith(hintText: 'E-Mail ID').copyWith(errorText: _emailValidate ? '\t\t\t\t\t\t\t\t\t\t\t\t   E-Mail Required' : null),
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
                      fontSize: 18,
                      fontFamily: 'Tushar'
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: TextField(
                      style: TextStyle(fontFamily: 'Tushar'),
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: textBox.copyWith(hintText: 'Password').copyWith(errorText: _passwordValidate ? '\t\t\t\t\t\t\t\t\t\t\t\t Password Required' : null),
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
            child: RoundedButton(
                text: 'Submit',
                color: Colors.black,
                textColor: LogoColor,
                fontSize: 15,
                onPress: (){

                  if(_nameValidate || _ageValidate ||
                      _dlValidate || _genderValidate ||
                      _phoneValidate || _emailValidate ||
                      _passwordValidate)
                  {
                    showAlertDialog(context);
                  }

                  else if(age! < 17)
                  { showAlertDialogAge(context); }

                  else if(_phone.text.length < 10)
                  { showAlertDialogPhone(context); }

                  else{
                    print(name);
                    print(age);
                    print(gender);
                    print(phone);
                    print(dl);
                    print(email);
                    print(password);
                  }
                },
            ),
          ),
        ],
      ),
    );
  }
}
