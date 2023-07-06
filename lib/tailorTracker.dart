import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:stitcher/model/tailorTracker.dart';
import 'ApiConfig/ApiConfig.dart';
import 'package:http/http.dart' as http;

class tailorTracker extends StatefulWidget {
  const tailorTracker({Key? key}) : super(key: key);

  @override
  State<tailorTracker> createState() => _tailorTrackerState();
}

class _tailorTrackerState extends State<tailorTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Tracker"),
        backgroundColor: Colors.purple[800],
      ),
      body: FutureBuilder(
        future: ApiConfig.gettailorTracker("10"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            List list = snapshot.data as List;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  String text = "";
                  Color color = Colors.red;
                  if (list[index]['status'] == '0') {
                    text = "Pending";
                    color = Colors.amber;
                  } else if (list[index]['status'] == '1') {
                    text = "Accepted";
                    color = Colors.green;
                  } else if (list[index]['status'] == '2') {
                    text = "Rejected";
                    color = Colors.red;
                  }
                  else if(list[index]['status'] == '3')
                    {
                       text="Completed";
                       color = Colors.green;
                    }

                    return InkWell(
                    onTap: () async {
                      TailorTracker tk = new TailorTracker(
                        list[index]['id'],
                        list[index]['customer_id'],
                        list[index]['tailor_id'],
                        list[index]['created_time'],
                        list[index]['created_date'],
                        list[index]['status'],
                        list[index]['deadline'],
                        list[index]['charges'],
                        list[index]['instructions'],
                        list[index]['measurement_id'],
                        list[index]['category'],
                        list[index]['name'],
                      );

                      // Navigator.push(context, MaterialPageRoute(builder: (context) => TailorDetail(tailor)));
                    },
                    child: Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.purple[800],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3luvcsWr-JRg2VVZc-CKWlISAqMP-C6_2HA&usqp=CAU",
                                    scale: 4.0,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      list[index]['created_date'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      list[index]['created_time'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Booking No : " + list[index]['id'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                                Text(
                                  "Deadline : " + list[index]['deadline'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Charges : " + list[index]['charges'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                                Text(
                                  "Tailor : " + list[index]['tname'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Category : " + list[index]['category'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                                Text(
                                  "Contact: " + list[index]['tcontact'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            (list[index]['status'] == '4')?
                            SizedBox(
                                  width: 180.0,
                                  height: 40.0,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      onPressed: () async {


                                      },
                                      child: Text(
                                        "Canceled By User",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.0),
                                      ))

                            ):
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  height: 40.0,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: color),
                                      onPressed: () {},
                                      child: Text(
                                        text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.0),
                                      )),
                                ),
                                SizedBox(width: 4.0,),
                                SizedBox(
                                  width: 120.0,
                                  height: 40.0,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      onPressed: () async {
                                        ProgressDialog pd = new ProgressDialog(context, title: Text("Cancel Order !"), message: Text("Please wait ... "));
                                        pd.show();
                                        var url = "https://jafasa.com/stitcher/api/cancelOrder.php";
                                        var response = await http.post(Uri.parse(url), body: {"order_id":list[index]['id']});
                                        var data = jsonDecode(response.body);

                                        if(data == "success")
                                        {
                                          pd.dismiss();
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => tailorTracker()));
                                        }
                                        else
                                        {
                                          pd.dismiss();
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Cancellation Failed ")));
                                        }

                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.0),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                });
          } else {
            return Center(
              child: Text("No Tailor in the List"),
            );
          }
        },
      ),
    );
  }
}
