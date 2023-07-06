import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

import 'AddOrder.dart';

class panjabiTopMeasurement extends StatefulWidget {
  const panjabiTopMeasurement({Key? key}) : super(key: key);

  @override
  State<panjabiTopMeasurement> createState() => _panjabiTopMeasurementState();
}

class _panjabiTopMeasurementState extends State<panjabiTopMeasurement> {
  TextEditingController kameezlambaiController = TextEditingController();
  TextEditingController chatiController = TextEditingController();
  TextEditingController underBustController = TextEditingController();
  TextEditingController waistSizeController = TextEditingController();
  TextEditingController hipController = TextEditingController();
  TextEditingController shouldercontroller = TextEditingController();
  TextEditingController armholeSizeController = TextEditingController();
  TextEditingController sleevesLengthController = TextEditingController();
  TextEditingController sleevesAroundController = TextEditingController();
  TextEditingController frontNeckController = TextEditingController();
  TextEditingController backNeckController = TextEditingController();
  TextEditingController shalwarLumbaiController = TextEditingController();
  TextEditingController sizeAroundAnkleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = new ProgressDialog(context,
        title: Text("measurement"), message: Text("Please wait..."));
    return Scaffold(
      appBar: AppBar(
        title: Text("Measurement of Customer"),
        elevation: 5.0,
        backgroundColor: Colors.purple[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 350,
          child: ListView(
            padding: EdgeInsets.only(left: 15, top: 15, right: 15),
            children: [
              Text(
                "MEASUREMENT FOR FEMALE",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              TextField(
                controller: kameezlambaiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Kameez Lambai",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: chatiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Chati",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: underBustController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Under Bust Size",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: waistSizeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Waist Size",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: hipController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Hip Size",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: shouldercontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Shoulder",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: armholeSizeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Armhole Size",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: sleevesLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Sleeve Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: sleevesAroundController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Sleeve Around",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: frontNeckController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Front Neck Depth",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: backNeckController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Back Neck Depth",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: shalwarLumbaiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Shalwar Lambai",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: sizeAroundAnkleController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Size Around Ankle",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 14.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[800],
                      padding: EdgeInsets.all(13.0),
                      textStyle: TextStyle(fontSize: 16.0)),
                  onPressed: () async {
                    dialog.show();

                    var kameezlambai = kameezlambaiController.text.toString();
                    var chati = chatiController.text.toString();
                    var underBust = underBustController.text.toString();
                    var waistSize = waistSizeController.text.toString();
                    var hip = hipController.text.toString();
                    var shoulder = shouldercontroller.text.toString();
                    var armholeSize = armholeSizeController.text.toString();
                    var sleevesLength = sleevesLengthController.text.toString();
                    var sleevesAround = sleevesAroundController.text.toString();
                    var frontNeck = frontNeckController.text.toString();
                    var backNeck = backNeckController.text.toString();
                    var shalwarLumbai = shalwarLumbaiController.text.toString();
                    var sizeAroundAnkle =
                        sizeAroundAnkleController.text.toString();
                    var email = "admin@gmail.com";

                    String url =
                        "https://jafasa.com/stitcher/api/panjabiTopMeasurement.php";
                    var response = await http.post(Uri.parse(url), body: {
                      "kameezlambai": kameezlambai,
                      "chati": chati,
                      "underBust": underBust,
                      "waistSize": waistSize,
                      "hip": hip,
                      "shoulder": shoulder,
                      "armholeSize": armholeSize,
                      "sleevesLength": sleevesLength,
                      "sleevesAround": sleevesAround,
                      "frontNeck": frontNeck,
                      "backNeck": backNeck,
                      "shalwarLambai": shalwarLumbai,
                      "sizeAroundAnkle": sizeAroundAnkle,
                      "email": email,
                    });

                    var data = jsonDecode(response.body);

                    if (data == "success") {
                      dialog.dismiss();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            "Insertion Successfull",
                            style: TextStyle(color: Colors.white),
                          )));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddOrder()));
                    } else {
                      dialog.dismiss();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            "Insertion Failed",
                            style: TextStyle(color: Colors.white),
                          )));
                    }
                  },
                  child: Text("Enter"))
            ],
          ),
        ),
      ),
    );
  }
}
