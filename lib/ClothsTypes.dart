import 'package:flutter/material.dart';

import 'Measurement.dart';
import 'ProfileSetting.dart';
import 'TailorList.dart';
class ClothsTypes extends StatefulWidget {
  const ClothsTypes({Key? key}) : super(key: key);

  @override
  State<ClothsTypes> createState() => _ClothsTypesState();
}

class _ClothsTypesState extends State<ClothsTypes> {
  var titleList = ["Measurement", "Tailors", "Cloths Tracker", "Profile"];
  var imageList = ["assets/images/measurement.png", "assets/images/customer.png",
    "assets/images/order.png", "assets/images/man.png"];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 5.0, crossAxisCount: 2, crossAxisSpacing: 5.0,
    ),
        itemCount: titleList.length,
        itemBuilder: (context, index)
        {
          return InkWell(
            onTap: () async{
              if(index == 0)
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Measurement()));
              }
              else if(index == 1)
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TailorList()));
              }
              else if(index == 2)
              {

              }
              else if(index == 3)
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileSetting()));
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
                    Image.asset(imageList[index], scale: 8.0,),
                    SizedBox(height: 15.0,),
                    Text(titleList[index],
                      style: TextStyle(color:Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
