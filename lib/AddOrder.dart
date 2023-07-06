import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Dashboard.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController dateinputController = TextEditingController();

  void initState() {
    dateinputController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = new ProgressDialog(context,
        title: Text("Measurement"), message: Text("Please wait.."));

    return Scaffold(
      appBar: AppBar(
        title: Text("Place Order"),
        backgroundColor: Colors.purple[800],
      ),
      body: Container(
        width: 350,
        child: ListView(
          padding: EdgeInsets.only(left: 15, top: 15, right: 15),
          children: [
            Text(
              "Further Details ",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, letterSpacing: 2),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Divider(
                height: 6.0,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            //Name TextField
            TextFormField(
              controller:
                  dateinputController, //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Select Deadline Date" //label text of field
                  ),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dateinputController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            //CONTACT TEXT FIELD
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: TextField(
                controller: descriptionController,
                maxLines: 5, //or null

                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Additional Instruction',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  var tailor_id = pref.getString("tailor_id");
                  var customer_email = pref.getString("email");
                  var category = pref.getString("category");
                  var measurement_id = pref.getString("measurement_id");
                  var deadline = dateinputController.text.toString();
                  var instruction = descriptionController.text.toString();
                  var cloth_id = pref.getString("cloth_id");
                  var ppm = pref.getString("ppm");

                  print(tailor_id);
                  print(customer_email);
                  print(category);
                  print(measurement_id);

                  String url = "https://jafasa.com/stitcher/api/myOrder.php";
                  var response = await http.post(Uri.parse(url), body: {
                    "tailor_id": tailor_id,
                    "customer_email": customer_email,
                    "category": category,
                    "measurement_id": measurement_id,
                    "deadline": deadline,
                    "instruction": instruction,
                    "cloth_id":cloth_id,
                    "ppm":ppm
                  });

                  var data = jsonDecode(response.body);
                  print(data);
                  if (data == "success") {
                    dialog.dismiss();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          "Order Successfull",
                          style: TextStyle(color: Colors.white),
                        )));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  } else {
                    dialog.dismiss();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          "Order Failed",
                          style: TextStyle(color: Colors.white),
                        )));
                  }
                },
                child: Text("Place Order"))
          ],
        ),
      ),
    );
  }
}
