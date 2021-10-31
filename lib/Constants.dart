import 'package:flutter/material.dart';

const Color LogoColor = Color.fromRGBO(245, 244, 16, 1);

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPress;

  RoundedButton({required this.text, required this.color, required this.textColor,required this.onPress});

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
              fontSize: 12
            ),
          ),
        ),
      ),
    );
  }
}
