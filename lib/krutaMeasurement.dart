import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stitcher/tailorCloth.dart';

import 'AddOrder.dart';

class krutaMeasurement extends StatefulWidget {
  const krutaMeasurement({Key? key}) : super(key: key);

  @override
  State<krutaMeasurement> createState() => _krutaMeasurementState();
}

class _krutaMeasurementState extends State<krutaMeasurement> {
  TextEditingController shouldercontroller = TextEditingController();
  TextEditingController frontNeckController = TextEditingController();
  TextEditingController backNeckController = TextEditingController();
  TextEditingController armholeLengthController = TextEditingController();
  TextEditingController shortSleevesController = TextEditingController();
  TextEditingController bicepsSizeController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController hipController = TextEditingController();
  TextEditingController kurtaLengthController = TextEditingController();
  TextEditingController elbowRoundController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tailor_id;
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
                "MEASUREMENT FOR GENTS KURTA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
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
                controller: armholeLengthController,
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
                controller: shortSleevesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Short Sleeves Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: bicepsSizeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Biceps Size",
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
                controller: kurtaLengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Kurta Length",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: elbowRoundController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Elbow Round",
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
                     tailor_id = pref.getString("tailor_id");
                    var shoulder = shouldercontroller.text.toString();
                    var frontNeck = frontNeckController.text.toString();
                    var backNeck = backNeckController.text.toString();
                    var arholeLegnth = armholeLengthController.text.toString();
                    var shortSleeves = shortSleevesController.text.toString();
                    var bicepsSize = bicepsSizeController.text.toString();
                    var waist = waistController.text.toString();
                    var hip = hipController.text.toString();
                    var kurtaLength = kurtaLengthController.text.toString();
                    var elbowRound = elbowRoundController.text.toString();
                    var email =  pref.getString("email");

                    String url =
                        "https://jafasa.com/stitcher/api/kurta_measurement.php";
                    var response = await http.post(Uri.parse(url), body: {
                      "shoulder": shoulder,
                      "frontNeck": frontNeck,
                      "bakNeck": backNeck,
                      "arholeLegnth": arholeLegnth,
                      "shortSleeves": shortSleeves,
                      "bicepsSize": bicepsSize,
                      "waist": waist,
                      "hip": hip,
                      "kurtaLength": kurtaLength,
                      "elbowRound": elbowRound,
                      "email": email,
                      "tailor_id":tailor_id
                    });

                    var data = jsonDecode(response.body);

                    print(data['message']);
                    print("Last Inserted Id ${data['id']}");

                    pref.setString("measurement_id", data['id'].toString());
                    pref.setString("category", "kurta");
                    if (data['message'] == "success") {
                      dialog.dismiss();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            "Insertion Successfull",
                            style: TextStyle(color: Colors.white),
                          )));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TailorCloth(tailor_id)));
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
