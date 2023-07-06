import 'package:flutter/material.dart';
import 'package:stitcher/MaleDesigns.dart';

import 'FemaleDesigns.dart';
class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Gender"),
        backgroundColor: Color(0xFF6F35A5),

      ),
      body:Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => MaleDesigns()));
              },
              child: Container(
                height: 200,
                width: 200,
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
                        Image.asset("assets/images/male.png", scale: 8.0,),
                        SizedBox(height: 25.0,),
                        Text("Male",
                          style: TextStyle(color:Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FemaleDesigns()));
              },
              child: Container(
                height: 200,
                width: 200,
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
                        Image.asset("assets/images/female.png", scale: 8.0,),
                        SizedBox(height: 25.0,),
                        Text("Female",
                          style: TextStyle(color:Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
