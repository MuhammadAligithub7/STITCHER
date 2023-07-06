import 'package:flutter/material.dart';
import 'package:stitcher/LehengaMeasurment.dart';
import 'package:stitcher/panjabiTopMeasurement.dart';
import 'package:stitcher/patyalaMeasurement.dart';
import 'package:stitcher/shalwarQameezMeasurement.dart';
import 'package:stitcher/skirtsMeasurement.dart';

class FemaleDesigns extends StatefulWidget {
  const FemaleDesigns({Key? key}) : super(key: key);

  @override
  State<FemaleDesigns> createState() => _FemaleDesignsState();
}

class _FemaleDesignsState extends State<FemaleDesigns> {
  var titleList = [
    "Lehenga",
    "Panjabi Top",
    "Patyala",
    "Shalwar Qameez",
    "Skirts",
  ];
  var imageList = [
    "assets/images/lehenga.png",
    "assets/images/top.png",
    "assets/images/patyala.png",
    "assets/images/sh.png",
    "assets/images/male.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Female Desings"),
        backgroundColor: Color(0xFF6F35A5),
      ),
      body: GridView.builder(
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => lehengaMeasurement()));
                } else if (index == 1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => panjabiTopMeasurement()));
                } else if (index == 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => patyalaMeasurement()));
                } else if (index == 3) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => shalwarQameezMeasurement()));
                } else if (index == 4) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => skirtsMeasurement()));
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
                        // scale: 8.0,
                        width: 80,
                        height: 80,
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
          }),
    );
  }
}
