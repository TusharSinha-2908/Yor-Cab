import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yorcab/Constants.dart';
import 'package:yorcab/Customer/End_Trip.dart';

class Start_Trip extends StatefulWidget {
  static const String id = "Start Trip Screen";
  final ScanResult scanResult;

  const Start_Trip({required this.scanResult});

  @override
  _Start_TripState createState() => _Start_TripState();
}

class _Start_TripState extends State<Start_Trip> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<String> driverInfo;
  Map<String,Timestamp> Journey = {};
  Map<String,String> journeyInfo = {};
  late Timestamp startTimeStamp, endTimeStamp;
  late DateTime startDate, endDate;
  late String startJourneyDate,endJourneyDate,startTime,endTime,duration;
  late String name,age,gender,phone,dl,email;
  bool spinner = true;

  @override
  void initState() {
    // TODO: implement initState
    getTime();
    getDriverInfo();
    setState(() {
      spinner = false;
    });
    super.initState();
  }

  void getDriverInfo() {
    driverInfo = widget.scanResult.rawContent.split(" ");
    int length = driverInfo.length;

    email = driverInfo[length-2];
    dl = driverInfo[length-3];
    phone = driverInfo[length-4];
    gender = driverInfo[length-5];
    age = driverInfo[length-6];
    name = "";

    for(int i = 0; i < length-6; i++)
    {
      name += driverInfo[i] + " ";
    }
  }

  void getTime()
  {
      startDate = DateTime.now();
      startTime = startDate.toLocal().toString().split(" ")[1].split(".")[0];
      startJourneyDate = startDate.toLocal().toString().split(" ")[0];
      startTimeStamp = Timestamp.now();
  }

  void endTrip()
  {
    endTimeStamp = Timestamp.now();
    endDate = DateTime.now();
    endJourneyDate = endDate.toLocal().toString().split(" ")[0];

    endTime = endDate.toLocal().toString().split(" ")[1].split(".")[0];

    setState(() {
      spinner = true;
    });

    Journey['From'] = startTimeStamp;
    Journey['Till'] = endTimeStamp;

    duration = endDate.difference(startDate).toString().split(".")[0];

    _firestore.collection("Work Time").doc(name + " " + email).collection("/Trips").doc(startJourneyDate + " " + startTime).set(
        {
          'Journey' : Journey,
          'Duration' : duration,
        });

    journeyInfo['start'] = startJourneyDate + " " + startTime;
    journeyInfo['end'] = endJourneyDate + " " + endTime;
    journeyInfo['duration'] = duration;

    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => End_Trip(Journey: journeyInfo)));

    setState(() {
      spinner = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: Scaffold(
        backgroundColor: LogoColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: LogoColor,
          title: Title(
            color: Colors.white,
            child: Text(
              'Trip Started',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tushar',
                  fontSize: 16
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Hero(
                      tag: 'Logo',
                      child: Image(
                        image: AssetImage('Images/photo.png'),
                        height: 130, width: 130,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 30,bottom: 10),
              child: Text(
                "Driver Details :",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Tushar'
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 25,right: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                       "Name : $name",
                       style: TextStyle(
                           fontFamily: 'Tushar',
                           fontSize: 12
                       ),
                     ),
                    SizedBox(height: 5),
                    Text(
                      "Age : $age           Gender : $gender",
                      style: TextStyle(
                          fontFamily: 'Tushar',
                          fontSize: 12
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Phone No. : $phone",
                      style: TextStyle(
                          fontFamily: 'Tushar',
                          fontSize: 12
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "DL No. : $dl",
                      style: TextStyle(
                          fontFamily: 'Tushar',
                          fontSize: 12
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "E-Mail : $email",
                      style: TextStyle(
                          fontFamily: 'Tushar',
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
              child: Text(
                "Trip Details :",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Tushar'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Start Date : $startJourneyDate",
                    style: TextStyle(
                        fontFamily: 'Tushar',
                        fontSize: 12
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Start Time : $startTime",
                    style: TextStyle(
                        fontFamily: 'Tushar',
                        fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: RoundedButton(
                  text: "End Trip",
                  color: Colors.black,
                  textColor: LogoColor,
                  onPress: ()=> endTrip(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}