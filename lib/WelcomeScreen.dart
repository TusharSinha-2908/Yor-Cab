import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yorcab/Constants.dart';
import 'Login.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'Welcome Screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateNext();
  }

  void navigateNext() async{
    await Future.delayed(Duration(seconds: 5),()=>{});
    Navigator.pushReplacementNamed(context, Login.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LogoColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Hero(
                    tag: 'Logo',
                    child: Image(
                      image: AssetImage('Images/photo.png'),
                      height: 200, width: 200,
                ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Center(
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          ' Yor Cab',
                          cursor: '.',
                          speed: const Duration(milliseconds: 250),
                          textStyle: TextStyle(
                              fontFamily: 'Tushar',
                              fontSize: 45,
                              color: Colors.black,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}