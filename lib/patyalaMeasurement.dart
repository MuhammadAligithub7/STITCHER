import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

import 'AddOrder.dart';

class patyalaMeasurement extends StatefulWidget {
  const patyalaMeasurement({Key? key}) : super(key: key);

  @override
  State<patyalaMeasurement> createState() => _patyalaMeasurementState();
}

class _patyalaMeasurementState extends State<patyalaMeasurement> {
  Widget build(BuildContext context) {
    TextEditingController shaoulderController = TextEditingController();
    TextEditingController neckDeepController = TextEditingController();
    TextEditingController bustSizeController = TextEditingController();
    TextEditingController waistSizeController = TextEditingController();
    TextEditingController topLengthController = TextEditingController();
    TextEditingController hipsSizecontroller = TextEditingController();
    TextEditingController shalwarBeltController = TextEditingController();
    TextEditingController shalwarLengthController = TextEditingController();
    TextEditingController bottomHoopController = TextEditingController();
    @override
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
                "MEASUREMENT FOR GENTS PATYALA",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              TextField(
                controller: shaoulderController,
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
                controller: neckDeepController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Neck Deep",
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
                controller: topLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Top Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: hipsSizecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Hips Size",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: shalwarBeltController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Shalwar Belt",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: shalwarLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Shalwar Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: bottomHoopController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Bottom Hoop",
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

                    var shaoulder = shaoulderController.text.toString();
                    var neckDeep = neckDeepController.text.toString();
                    var bustSize = bustSizeController.text.toString();
                    var waistSize = waistSizeController.text.toString();
                    var topLength = topLengthController.text.toString();
                    var hipsSize = hipsSizecontroller.text.toString();
                    var shalwarBelt = shalwarBeltController.text.toString();
                    var shalwarLength = shalwarLengthController.text.toString();
                    var bottomHoop = bottomHoopController.text.toString();
                    var email = "admin@gmail.com";

                    String url =
                        "https://jafasa.com/stitcher/api/patiala_measurement.php";
                    var response = await http.post(Uri.parse(url), body: {
                      "shaoulder": shaoulder,
                      "neckDeep": neckDeep,
                      "bustSize": bustSize,
                      "waistSize": waistSize,
                      "topLength": topLength,
                      "hipsSize": hipsSize,
                      "shalwarBelt": shalwarBelt,
                      "shalwarLength": shalwarLength,
                      "bottomHoop": bottomHoop,
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
