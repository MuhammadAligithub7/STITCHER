import 'package:flutter/material.dart';
import 'package:stitcher/constants.dart';
class Measurement extends StatefulWidget {
  const Measurement({Key? key}) : super(key: key);

  @override
  State<Measurement> createState() => _MeasurementState();
}

class _MeasurementState extends State<Measurement> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = new TextEditingController();
    TextEditingController contactController = new TextEditingController();
    TextEditingController kameezController = new TextEditingController();
    TextEditingController bazoController = new TextEditingController();
    TextEditingController teraController = new TextEditingController();
    TextEditingController galaController = new TextEditingController();
    TextEditingController chatiController = new TextEditingController();
    TextEditingController geraController = new TextEditingController();
    TextEditingController shalwarController = new TextEditingController();
    TextEditingController panchaController = new TextEditingController();
    TextEditingController kaffController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Measurement"),
        backgroundColor: Color(0xFF6F35A5),
      ),
      body: Container(
        width: 350,
        decoration: BoxDecoration(
            border:Border.all(color: Colors.deepPurple, width: 2,)
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 15, top: 15, right: 15),
          children: [
            Text("CUSTOMER", style: TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 2),),
            SizedBox(height: 6.0,),
            //Name TextField
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person),
                  hintText:"Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            //CONTACT TEXT FIELD
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.contact_phone_outlined),
                  hintText:"Contact No",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 19.0,),
            Text("MEASUREMENT", style: TextStyle(fontSize: 20.0,),),
            SizedBox(height: 6.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Kameez Lambai",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText:"Bazo",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText:"Tera",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText:"Gala",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText:"Chati",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText:"Gera",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText:"Shalwar Lambai",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText:"Pancha",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(

                  hintText:"Kaff",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text("2piece Kolor", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                       Checkbox(
                           value: false,
                           onChanged: (value)
                           {

                           })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("shirwani gala", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Single Selai", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Double Selai", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fit Kaff", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Plate Kaff", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Choras Gera", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gol Gera", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gol Bazo", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kaff Gol", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kaj", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tanka Patti", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),
                ],
              ),
            ),

            //single row
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Front Pocket", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("side Pocket", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shalwar Pocket", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      Checkbox(
                          value: false,
                          onChanged: (value)
                          {

                          })
                    ],
                  ),

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
