import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yorcab/Constants.dart';

class End_Trip extends StatefulWidget {
  static const String id = "End Trip";
  final Map<String,String> Journey;

  const End_Trip({required this.Journey});

  @override
  _End_TripState createState() => _End_TripState();
}

class _End_TripState extends State<End_Trip> {
  bool spinner = false;
  late String startTime, endTime, duration;

  @override
  void initState() {
    // TODO: implement initState
    getTimeInfo();
    super.initState();
  }

  void getTimeInfo()
  {
    startTime = widget.Journey['start'] as String;
    endTime = widget.Journey['end'] as String;
    duration = widget.Journey['duration'] as String;
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
            color: Colors.black,
            child: Text(
              'Trip Complete!',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tushar',
                  fontSize: 18
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
              padding: const EdgeInsets.only(top: 30,bottom: 10),
              child: Center(
                child: Text(
                  "   Thank You For \nTravelling With Us!",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Tushar'
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 30,bottom: 10),
              child: Text(
                " Journey Details :-",
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
                    "Started On : $startTime",
                    style: TextStyle(
                        fontFamily: 'Tushar',
                        fontSize: 12
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Ended On : $endTime",
                    style: TextStyle(
                        fontFamily: 'Tushar',
                        fontSize: 12
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Total Duration : $duration Hours",
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
                  text: "Done",
                  color: Colors.black,
                  textColor: LogoColor,
                  onPress: () async{

                    setState(() {
                      spinner = true;
                    });

                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pop(context);

                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
