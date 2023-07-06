import 'package:flutter/material.dart';
import 'package:stitcher/ApiConfig/ApiConfig.dart';
import 'package:stitcher/Measurement.dart';
import 'package:stitcher/ProfileSetting.dart';
import 'package:stitcher/tailorCloth.dart';
import 'package:stitcher/tailorTracker.dart';

import 'ArchiveOrders.dart';
import 'GenderSelection.dart';
import 'TailorList.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var titleList = [

    "Tailors",
    "Order Tracker",
    "Book Order",
    "Archive Order",
    "Profile",
    "Exit"
  ];
  var imageList = [

    "assets/images/customer.png",
    "assets/images/order.png",
    "assets/images/clothing.png",
    "assets/images/archive.png",
    "assets/images/man.png",
    "assets/images/shutdown.png"
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5.0,
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
        ),
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              if (index == 0) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TailorList()));
              } else if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => tailorTracker()));
              } else if (index == 2) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TailorList()));
              } else if (index == 3) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ArchiveOrders()));
              }
              else if (index == 4) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileSetting()));
              }
            },
            child: Card(
              elevation: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Color(0xFF6F35A5).withOpacity(0.9),
                ),
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      imageList[index],
                      scale: 8.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      titleList[index],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
