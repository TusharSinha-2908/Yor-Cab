import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yorcab/Constants.dart';

class Driver_Details extends StatefulWidget {
  final ScanResult scanResult;

  const Driver_Details({required this.scanResult});

  @override
  _Driver_DetailsState createState() => _Driver_DetailsState();
}

class _Driver_DetailsState extends State<Driver_Details> {

  late String name, age, gender, phone, dl, email;
  late List<String> driverInfo;
  bool spinner = true;

  @override
  void initState() {
    // TODO: implement initState

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
              'Yor Cab',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tushar',
                  fontSize: 17
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
              padding: const EdgeInsets.only(left: 10,top: 30,bottom: 15),
              child: Text(
                "Driver Details :",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Tushar'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 10,bottom: 15),
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
                  SizedBox(height: 6),
                  Text(
                    "Age : $age           Gender : $gender",
                    style: TextStyle(
                        fontFamily: 'Tushar',
                        fontSize: 12
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Phone No. : $phone",
                    style: TextStyle(
                        fontFamily: 'Tushar',
                        fontSize: 12
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "DL No. : $dl",
                    style: TextStyle(
                        fontFamily: 'Tushar',
                        fontSize: 12
                    ),
                  ),
                  SizedBox(height: 6),
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
            Center(
              child: RoundedButton(
                text: "Done",
                color: Colors.black,
                textColor: LogoColor,
                onPress: ()=> Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
