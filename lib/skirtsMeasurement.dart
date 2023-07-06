import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'AddOrder.dart';

class skirtsMeasurement extends StatefulWidget {
  const skirtsMeasurement({Key? key}) : super(key: key);

  @override
  State<skirtsMeasurement> createState() => _skirtsMeasurementState();
}

class _skirtsMeasurementState extends State<skirtsMeasurement> {
  TextEditingController shaoulderSizeController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController bustSizeController = TextEditingController();
  TextEditingController underBustSizeController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController lowWaistController = TextEditingController();
  TextEditingController slvFullLengthcontroller = TextEditingController();
  TextEditingController muscleLengthController = TextEditingController();
  TextEditingController elbowLengthController = TextEditingController();
  TextEditingController cuffSizeController = TextEditingController();
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
                "MEASUREMENT FOR LADIES SKIRTS",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              TextField(
                controller: shaoulderSizeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Shoulder Size",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: lengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: bustSizeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Bust Size",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: underBustSizeController,
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
                controller: waistController,
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
                controller: lowWaistController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Low Waist",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: slvFullLengthcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "SLV Full Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: muscleLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Muscle Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: elbowLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Elbow Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: cuffSizeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Cuff Size",
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

                    var shaoulderSize = shaoulderSizeController.text.toString();
                    var length = lengthController.text.toString();
                    var bustSize = bustSizeController.text.toString();
                    var underBustSize = underBustSizeController.text.toString();
                    var waist = waistController.text.toString();
                    var lowWaist = lowWaistController.text.toString();
                    var slvFullLength = slvFullLengthcontroller.text.toString();
                    var muscleLength = muscleLengthController.text.toString();
                    var elbowLength = elbowLengthController.text.toString();
                    var cuffSize = cuffSizeController.text.toString();
                    var email = "admin@gmail.com";

                    String url =
                        "https://jafasa.com/stitcher/api/skirts_measurement.php";
                    var response = await http.post(Uri.parse(url), body: {
                      "shaoulderSize": shaoulderSize,
                      "length": length,
                      "bustSize": bustSize,
                      "underBustSize": underBustSize,
                      "waist": waist,
                      "lowWaist": lowWaist,
                      "slvFullLength": slvFullLength,
                      "muscleLength": muscleLength,
                      "elbowLength": elbowLength,
                      "cuffSize": cuffSize,
                      "enail": email,
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
