import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:yorcab/Constants.dart';

class Driver_QR extends StatefulWidget {
  static const String id = "Driver QR Screen";
  const Driver_QR({Key? key}) : super(key: key);

  @override
  _Driver_QRState createState() => _Driver_QRState();
}

class _Driver_QRState extends State<Driver_QR> {
  String userData = 'No Data Captured!';
  late User currentUser;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool spinner = false;
  String userName = 'User';

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    getData();
    super.initState();
  }

  void getCurrentUser() async{
    setState(() {
      spinner = true;
    });

    try {
      final user = _auth.currentUser;
      if (user != null) currentUser = user;
      print(currentUser.email);
    }
    catch (e) { print(e); }

    await Future.delayed(Duration(seconds: 2));
  }

  void getData() async
  {
    await Future.delayed(Duration(seconds: 2));

    var collection = _firestore.collection("Drivers");
    var querySnapshot = await collection.get();

    for(var query in querySnapshot.docs)
    {
         Map<String, dynamic> info = query.data();
         if(currentUser.email == info['E-Mail'])
         {
           String name = info['Name'].toString();
           String age = info['Age'].toString();
           String gender = info['Gender'].toString();
           String phone = info['Phone No.'].toString();
           String dl = info['DL No.'].toString();
           String email = info['E-Mail'].toString();

           String data = name + " " + age + " " + gender + " " + 
                         phone + " " + dl + " " + email;

           setState(() {
             userData = data;
             userName = name.split(" ")[0];
             spinner = false;
           });

           break;
         }
    }
  }

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
              'Yor Cab',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tushar',
                  fontSize: 17
              ),
            ),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20),
                child: Text(
                    "Welcome Back ${userName}! ",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Tushar',
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80,right: 80,top: 30),
                child: Container(
                  padding: EdgeInsets.all(1.5),
                  color: Colors.black,
                  child: Container(
                    color: Colors.white,
                    child: QrImage(
                        data: userData,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Center(
                  child: Text(
                    "   Ask your customer to scan \nthis QR code to begin the ride.",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Tushar',
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 70),
                  child: RoundedButton(
                      text: 'Log Out',
                      fontSize: 15,
                      color: Colors.black,
                      textColor: LogoColor,
                      onPress: (){

                        setState(() {
                          spinner = true;
                        });

                        _auth.signOut();
                        _firestore.terminate();
                        Navigator.pop(context);

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
