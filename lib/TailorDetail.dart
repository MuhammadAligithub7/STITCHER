import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stitcher/ClothsTypes.dart';
import 'package:stitcher/GenderSelection.dart';
import 'package:stitcher/MapLocation.dart';
import 'package:stitcher/tailorCloth.dart';

import 'model/Tailor.dart';

class TailorDetail extends StatefulWidget {
  Tailor tailor;

  TailorDetail(this.tailor);

  @override
  State<TailorDetail> createState() => _TailorDetailState();
}

class _TailorDetailState extends State<TailorDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tailor Detail"),
        backgroundColor: Colors.purple[800],
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3luvcsWr-JRg2VVZc-CKWlISAqMP-C6_2HA&usqp=CAU",
                scale: 2.0,
              ),
            ),
            Text(
              widget.tailor.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Contact ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.tailor.contact,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Email ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.tailor.email,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Country ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.tailor.country,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "City ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.tailor.city,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.42,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(

                    ),
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString("tailor_id", widget.tailor.id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenderSelection()));
                      },
                      child: Text("Book Order")),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.42,
                  child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences pref =
                        await SharedPreferences.getInstance();
                        pref.setString("tailor_id", widget.tailor.id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapLocation(widget.tailor)));
                      },
                      child: Text("Map Location")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
