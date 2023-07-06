import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stitcher/tailorCloth.dart';
import 'AddOrder.dart';

class shalwarQameezMeasurement extends StatefulWidget {
  const shalwarQameezMeasurement({Key? key}) : super(key: key);

  @override
  State<shalwarQameezMeasurement> createState() =>
      _shalwarQameezMeasurementState();
}

class _shalwarQameezMeasurementState extends State<shalwarQameezMeasurement> {
  TextEditingController shaoulderLengthController = TextEditingController();
  TextEditingController armHoleController = TextEditingController();
  TextEditingController sleevesLengthController = TextEditingController();
  TextEditingController chestSizeController = TextEditingController();
  TextEditingController hipSizeController = TextEditingController();
  TextEditingController fulLengthcontroller = TextEditingController();
  TextEditingController fulLengthShalwarcontroller = TextEditingController();
  TextEditingController waistLengthController = TextEditingController();
  TextEditingController bottomShalwarController = TextEditingController();
  var tailor_id;
  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = new ProgressDialog(context,
        title: Text("Saving Measurement"), message: Text("Please wait..."));
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
                "MEASUREMENT FOR GENTS",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              TextField(
                controller: shaoulderLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Shoulder Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: armHoleController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Armhole Length",
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
                    hintText: "Sleeves Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: chestSizeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Chest Size",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: hipSizeController,
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
                controller: fulLengthcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Full Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: fulLengthShalwarcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Full Length Shalwar",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: waistLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Waist Length Shalwar",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: bottomShalwarController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Bottom Shalwar",
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
                    SharedPreferences pref =
                    await SharedPreferences.getInstance();
                    var shaoulderLength =
                        shaoulderLengthController.text.toString();
                    var armHole = armHoleController.text.toString();
                    var sleevesLength = sleevesLengthController.text.toString();
                    var chestSize = chestSizeController.text.toString();
                    var hipSize = hipSizeController.text.toString();
                    var fulLength = fulLengthcontroller.text.toString();
                    var fulLengthShalwar =
                        fulLengthShalwarcontroller.text.toString();
                    var waistLength = waistLengthController.text.toString();
                    var bottomShalwar = bottomShalwarController.text.toString();
                    var email =  pref.getString("email");
                     tailor_id = pref.getString("tailor_id");

                    String url =
                        "https://jafasa.com/stitcher/api/shalwar_measurement.php";
                    var response = await http.post(Uri.parse(url), body: {
                      "shaoulderLength": shaoulderLength,
                      "armHole": armHole,
                      "sleevesLength": sleevesLength,
                      "chestSize": chestSize,
                      "hipSize": hipSize,
                      "fulLength": fulLength,
                      "fulLengthShalwar": fulLengthShalwar,
                      "waistLength": waistLength,
                      "bottomShalwar": bottomShalwar,
                      "email": email,
                      "tailor_id":tailor_id
                    });

                    var data = jsonDecode(response.body);

                    pref.setString("measurement_id", data['id'].toString());
                    pref.setString("category", "shalwar");
                    if (data['message'] == "success") {
                      dialog.dismiss();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            "Insertion Successfull ",
                            style: TextStyle(color: Colors.white),
                          )));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TailorCloth(tailor_id)));
                    } else {
                      dialog.dismiss();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            "Insertion Failed "+data['message'],
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
