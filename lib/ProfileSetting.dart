
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stitcher/ApiConfig/ApiConfig.dart';
import 'package:stitcher/widget/constants.dart';
import 'package:stitcher/widget/profile_list_item.dart';
class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  SharedPreferences? preferences;
  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete((){
      setState(() {});
    });
  }

  Future<void> initializePreference() async{
    this.preferences = await SharedPreferences.getInstance();

  }
  @override
  Widget build(BuildContext context) {
    // return ProfileScreen();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Profile"),
          backgroundColor: Colors.deepPurple,
        ),
          body: FutureBuilder(
              future: ApiConfig.getuserProfile(preferences!.getString("email")!),
              builder: (context, AsyncSnapshot snanshot)
              {
                if(snanshot.hasData && !snanshot.hasError)
                {
                  List list = snanshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index)
                      {

                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.0),
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child:  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.accessibility_outlined,
                                        size: 25,
                                        color: Colors.deepPurple,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        list[index]['name'],
                                        style: kTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0
                                        ),
                                      ),
                                      Spacer(),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5.0),
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child:  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.email,
                                        size: 25,
                                        color: Colors.deepPurple,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        list[index]['email'],
                                        style: kTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0
                                        ),
                                      ),
                                      Spacer(),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5.0),
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child:  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 25,
                                        color: Colors.deepPurple,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        list[index]['contact'],
                                        style: kTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0
                                        ),
                                      ),
                                      Spacer(),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              margin: EdgeInsets.all(5.0),
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child:  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 25,
                                        color: Colors.deepPurple,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        list[index]['contact'],
                                        style: kTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0
                                        ),
                                      ),
                                      Spacer(),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.all(5.0),
                            //   child: Card(
                            //     child: Container(
                            //       padding: EdgeInsets.all(10.0),
                            //       child:  Row(
                            //         children: <Widget>[
                            //           Icon(
                            //             Icons.location_searching,
                            //             size: 30,
                            //           ),
                            //           SizedBox(width: 15),
                            //           Text(
                            //             list[index]['country'],
                            //             style: kTitleTextStyle.copyWith(
                            //                 fontWeight: FontWeight.w500,
                            //                 fontSize: 16.0
                            //             ),
                            //           ),
                            //           Spacer(),
                            //
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.all(4.0),
                            //   child: Card(
                            //     child: Container(
                            //
                            //       padding: EdgeInsets.all(10.0),
                            //       child:  Row(
                            //         children: <Widget>[
                            //           Icon(
                            //             Icons.location_city,
                            //             size: 30,
                            //           ),
                            //           SizedBox(width: 15),
                            //           Text(
                            //             list[index]['city'],
                            //             style: kTitleTextStyle.copyWith(
                            //                 fontWeight: FontWeight.w500,
                            //                 fontSize: 16.0
                            //             ),
                            //           ),
                            //           Spacer(),
                            //
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        );
                      });
                }
                else
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })

      ),
    );
  }
}



// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//
//     var profileInfo = Expanded(
//       child: Column(
//         children: <Widget>[
//           Container(
//             height:100,
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.only(top: 30),
//             child: Stack(
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage('assets/images/avatar.png'),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: 25,
//                     width: 25,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).accentColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       heightFactor:15,
//                       widthFactor: 15,
//                       child: Icon(
//                         LineAwesomeIcons.pen,
//                         color: kDarkPrimaryColor,
//                         size: 15,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Nicolas Adams',
//             style: kTitleTextStyle,
//           ),
//           SizedBox(height: 5),
//           Text(
//             'nicolasadams@gmail.com',
//             style: kCaptionTextStyle,
//           ),
//           SizedBox(height:20),
//           Container(
//             height: 40,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Theme.of(context).accentColor,
//             ),
//             child: Center(
//               child: Text(
//                 'Upgrade to PRO',
//                 style: kButtonTextStyle,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//     var themeSwitcher = ThemeSwitcher(
//       builder: (context) {
//         return AnimatedCrossFade(
//           duration: Duration(milliseconds: 200),
//           crossFadeState:
//           ThemeProvider.of(context).brightness == Brightness.dark
//               ? CrossFadeState.showFirst
//               : CrossFadeState.showSecond,
//           firstChild: GestureDetector(
//             onTap: () =>
//                 ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
//             child: Icon(
//               LineAwesomeIcons.sun,
//               size: MediaQuery.of(context).size.width,
//             ),
//           ),
//           secondChild: GestureDetector(
//             onTap: () =>
//                 ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
//             child: Icon(
//               LineAwesomeIcons.moon,
//               size: 30.0,
//             ),
//           ),
//         );
//       },
//     );
//
//     var header = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(width: 30),
//         Icon(
//           LineAwesomeIcons.arrow_left,
//           size:30,
//         ),
//         profileInfo,
//         themeSwitcher,
//         SizedBox(width: 30),
//       ],
//     );
//
//     return ThemeSwitchingArea(
//       child: Builder(
//         builder: (context) {
//           return Scaffold(
//             body: Column(
//               children: <Widget>[
//                 SizedBox(height: 50),
//                 header,
//                 Expanded(
//                   child: ListView(
//                     children: <Widget>[
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.user_shield,
//                         text: 'Privacy',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.history,
//                         text: 'Purchase History',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.question_circle,
//                         text: 'Help & Support',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.cog,
//                         text: 'Settings',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.user_plus,
//                         text: 'Invite a Friend',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.alternate_sign_out,
//                         text: 'Logout',
//                         hasNavigation: false,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

