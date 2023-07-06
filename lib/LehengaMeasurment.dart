import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';
import 'AddOrder.dart';

class lehengaMeasurement extends StatefulWidget {
  const lehengaMeasurement({Key? key}) : super(key: key);

  @override
  State<lehengaMeasurement> createState() => _lehengaMeasurementState();
}

class _lehengaMeasurementState extends State<lehengaMeasurement> {
  TextEditingController waistcontroller = TextEditingController();
  TextEditingController hipController = TextEditingController();
  TextEditingController lehengaLengthController = TextEditingController();
  TextEditingController shoulderFullLengthController = TextEditingController();
  TextEditingController waistAroundController = TextEditingController();
  TextEditingController frontNeckController = TextEditingController();
  TextEditingController bustController = TextEditingController();
  TextEditingController backNeckController = TextEditingController();
  TextEditingController blouseLengthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = new ProgressDialog(context,
        title: Text("Measurement"), message: Text("Please wait.."));

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
                "MEASUREMENT FOR LADIES LEHENGA",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              TextField(
                controller: waistcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Waist",
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
                    hintText: "Hip",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: lehengaLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Lehenga Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: shoulderFullLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Shoulder Full Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: waistAroundController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Waist Around",
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
                controller: bustController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Bust  Measurement",
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
                    hintText: "Back Neck depth",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: blouseLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Blouse Length",
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

                    var waist = waistcontroller.text.toString();
                    var hip = hipController.text.toString();
                    var lehengaLength = lehengaLengthController.text.toString();
                    var shoulderFullLength =
                        shoulderFullLengthController.text.toString();
                    var waistAround = waistAroundController.text.toString();
                    var frontNeck = frontNeckController.text.toString();
                    var bust = bustController.text.toString();
                    var backNeck = backNeckController.text.toString();
                    var blouseLength = blouseLengthController.text.toString();
                    var email = "admin@gmail.com";

                    String url =
                        "https://jafasa.com/stitcher/api/lehenga_measurement.php";
                    var response = await http.post(Uri.parse(url), body: {
                      "waist": waist,
                      "hip": hip,
                      "lehengaLength": lehengaLength,
                      "shoulderFullLength": shoulderFullLength,
                      "waistAround": waistAround,
                      "frontNeck": frontNeck,
                      "bust": bust,
                      "backNeck": backNeck,
                      "blouseLength": blouseLength,
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
