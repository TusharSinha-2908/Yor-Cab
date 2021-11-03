import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yorcab/Constants.dart';
import 'package:yorcab/Customer/End_Trip.dart';

class Start_Trip extends StatefulWidget {
  static const String id = "Start Trip Screen";
  final ScanResult scanResult;

  const Start_Trip(@required this.scanResult);

  @override
  _Start_TripState createState() => _Start_TripState();
}

class _Start_TripState extends State<Start_Trip> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<String> driverInfo;
  Map<String,Timestamp> Journey = {};
  Map<String,String> journeyInfo = {};
  late Timestamp startTimeStamp, endTimeStamp;
  DateTime startDate = DateTime.now();
  late DateTime endDate;
  late String currentDate,startTime,endTime,duration;
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

  void getDriverInfo()
  {
    driverInfo = widget.scanResult.rawContent.split(" ");
    if(driverInfo.length == 6) {
      name = driverInfo[0];
      age = driverInfo[1];
      gender = driverInfo[2];
      phone = driverInfo[3];
      dl = driverInfo[4];
      email = driverInfo[5];
    }
    else{
      name = driverInfo[0] + " " + driverInfo[1];
      age = driverInfo[2];
      gender = driverInfo[3];
      phone = driverInfo[4];
      dl = driverInfo[5];
      email = driverInfo[6];
    }
  }

  void getTime()
  {
      startTime = startDate.toLocal().toString().split(" ")[1].split(".")[0];
      currentDate = startDate.toLocal().toString().split(" ")[0];
      startTimeStamp = Timestamp.now();
  }

  void endTrip()
  {
    endTimeStamp = Timestamp.now();
    endDate = DateTime.now();

    endTime = endDate.toLocal().toString().split(" ")[1].split(".")[0];

    setState(() {
      spinner = true;
    });

    Journey['From'] = startTimeStamp;
    Journey['Till'] = endTimeStamp;

    duration = endDate.difference(startDate).toString().split(".")[0];

    _firestore.collection("Work Time").doc(name).collection("/Trips").doc(currentDate + " " + startTime).set(
        {
          'Journey' : Journey,
          'Duration' : duration,
        });

    journeyInfo['start'] = startTime;
    journeyInfo['end'] = endTime;
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
                    "Start Date : $currentDate",
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