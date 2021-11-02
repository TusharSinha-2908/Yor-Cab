import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color LogoColor = Color.fromRGBO(245, 244, 16, 1);

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPress;
  final double? fontSize;

  RoundedButton({required this.text, required this.color, required this.textColor,required this.onPress,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Tushar',
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: fontSize == null ? 12.0 : fontSize
            ),
          ),
        ),
      ),
    );
  }
}

const textBox = InputDecoration(
   errorStyle: TextStyle(fontFamily: 'Tushar'),
   hintText: '',
   hintStyle: TextStyle(
       color: Colors.black38,
       fontFamily: 'Tushar'
   ),
   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
   border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0)),),

   enabledBorder: OutlineInputBorder(
       borderSide: BorderSide(color: Colors.black, width: 1.0),
       borderRadius: BorderRadius.all(Radius.circular(32.0)),),

   focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(color: Colors.black, width: 2.0),
       borderRadius: BorderRadius.all(Radius.circular(32.0)),),
);

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text(
        "OK",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
        "Yor Cab",
        style: TextStyle(fontFamily: 'Tushar'),
    ),
    content: Text(
        "Enter the details properly.",
        style: TextStyle(fontFamily: 'Tushar'),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogAge(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Yor Cab",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    content: Text(
      "Age must be greater than 17 Yrs.",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogPhone(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Yor Cab",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    content: Text(
      "Phone number must be of 10 digits.",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogLogin(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Yor Cab",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    content: Text(
      "Wrong credentials or User does\'nt exist.",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogPassword(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Yor Cab",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    content: Text(
      "Password must be of atleast 6 characters.",
      style: TextStyle(fontFamily: 'Tushar'),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}