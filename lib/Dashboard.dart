import 'package:flutter/material.dart';
import 'package:stitcher/DashboardScreen.dart';
import 'package:stitcher/MapScreen.dart';
import 'package:stitcher/Measurement.dart';
import 'package:stitcher/ProfileSetting.dart';
import 'package:stitcher/Screens/Login/login_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stitcher"),
        backgroundColor: Color(0xFF6F35A5),
        elevation: 5.0,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6F35A5),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Stitcher',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(
                Icons.track_changes,
                color: Colors.deepPurple,
              ),
              title: const Text('Tailor Tracker'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.deepPurple,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSetting()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.logout_sharp,
                color: Colors.red,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
        ),
      ),
      body: DashboardScreen(),
    );
  }
}
