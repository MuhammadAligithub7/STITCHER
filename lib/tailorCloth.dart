import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stitcher/AddOrder.dart';
import 'package:stitcher/ApiConfig/ApiConfig.dart';
import 'package:stitcher/GenderSelection.dart';
import 'package:stitcher/animation/FadeAnimation.dart';

class TailorCloth extends StatefulWidget {
  String tailor_id;
  TailorCloth(this.tailor_id);

  @override
  State<TailorCloth> createState() => _CustomerState();
}

class _CustomerState extends State<TailorCloth> {

  int selectedService = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6F35A5),
        elevation: 5.0,
        title: Text("Cloth List"),
      ),

      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: FutureBuilder(
                  future: ApiConfig.getTailorCloth(widget.tailor_id),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData && !snapshot.hasError) {
                      List list = snapshot.data;
                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context,
                              int index) {



                            return FadeAnimation((1.0 + index) / 4,
                                serviceContainer(
                                    list[index]['id'],
                                    "https://jafasa.com/stitcher/tailor/assets/img/"+list[index]['image'],
                                    list[index]['title'],list[index]['price_per_meter'], index));
                          }
                      );
                    }
                    else
                    {
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },


                ),
              ),
            ]
        ),
      ),
    );
  }

  serviceContainer(String id, String image, String name, String price_per_meter, int index) {
    return GestureDetector(
      onTap: () async {

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("cloth_id", id);
        preferences.setString("ppm", price_per_meter);
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddOrder()));
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });



      },
      child: AnimatedContainer(
        height: 200,
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index ? Colors.blue : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 110, width: 140, fit: BoxFit.fill,),
              SizedBox(height: 5,),
              Text(name, style: TextStyle(fontSize: 16),),
              SizedBox(height: 3,),
              Text("PKR "+price_per_meter+" Per meter", style: TextStyle(fontSize: 11),)

            ]
        ),
      ),
    );
  }
}


