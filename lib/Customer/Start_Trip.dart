import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:yorcab/Constants.dart';

class Start_Trip extends StatefulWidget {
  static const String id = "Start Trip Screen";
  final ScanResult scanResult;

  const Start_Trip(@required this.scanResult);

  @override
  _Start_TripState createState() => _Start_TripState();
}

class _Start_TripState extends State<Start_Trip> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LogoColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: LogoColor,
        title: Title(
            color: Colors.black,
            child: Text(
                'Trip Started',
                 style: TextStyle(
                   color: Colors.black,
                   fontFamily: 'Tushar',
                   fontSize: 23
                 ),
            ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              widget.scanResult.rawContent,
              style: TextStyle(
                fontFamily: 'Tushar',
                fontSize: 14
              ),
            ),
          ),
          SizedBox(height: 60),
          RoundedButton(
              text: "End Trip",
              color: Colors.black,
              textColor: LogoColor,
              onPress: ()=>{}
          ),
        ],
      ),
    );
  }
}
