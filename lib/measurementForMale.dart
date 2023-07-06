import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stitcher/tailorCloth.dart';
import 'AddOrder.dart';

class measurementForMale extends StatefulWidget {
  const measurementForMale({Key? key}) : super(key: key);

  @override
  State<measurementForMale> createState() => _measurementForMaleState();
}

class _measurementForMaleState extends State<measurementForMale> {
  TextEditingController kameezcontroller = TextEditingController();
  TextEditingController bazoController = TextEditingController();
  TextEditingController teraController = TextEditingController();
  TextEditingController galaController = TextEditingController();
  TextEditingController chatiController = TextEditingController();
  TextEditingController geraController = TextEditingController();
  TextEditingController shalwarLumbaiController = TextEditingController();
  TextEditingController panchaController = TextEditingController();
  TextEditingController kaffController = TextEditingController();
  var tailor_id;
  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = new ProgressDialog(context,
        title: Text("measurement"), message: Text("Please wait..."));
    return Scaffold(
      appBar: AppBar(
        title: Text("Measurement of Male"),
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
                "MEASUREMENT",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              TextField(
                controller: kameezcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Kameez Lambai",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: bazoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Bazo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: teraController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Tera",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: galaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Gala",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0))),
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
                        borderRadius: BorderRadius.circular(21.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: geraController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Gera",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0))),
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
                        borderRadius: BorderRadius.circular(21.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: panchaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Pancha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: kaffController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Kaff",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0))),
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[800],
                      padding: EdgeInsets.all(13.0),
                      textStyle: TextStyle(fontSize: 16.0)),
                  onPressed: () async {
                    dialog.show();

                     SharedPreferences pref = await SharedPreferences.getInstance();
                    var kameez = kameezcontroller.text.toString();
                    var bazo = bazoController.text.toString();
                    var tera = teraController.text.toString();
                    var gala = galaController.text.toString();
                    var chati = chatiController.text.toString();
                    var gera = geraController.text.toString();
                    var shalwarLumbai = shalwarLumbaiController.text.toString();
                    var pancha = panchaController.text.toString();
                    var kaff = kaffController.text.toString();
                    var email = pref.getString("email");
                     tailor_id = pref.getString("tailor_id");

                    String url =
                        "https://jafasa.com/stitcher/api/male_measurement.php";
                    var response = await http.post(Uri.parse(url), body: {
                      "kameez": kameez,
                      "bazo": bazo,
                      "tera": tera,
                      "gala": gala,
                      "chati": chati,
                      "gera": gera,
                      "shalwarLumbai": shalwarLumbai,
                      "pancha": pancha,
                      "kaff": kaff,
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
