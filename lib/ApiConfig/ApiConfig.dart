import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiConfig {
  static Future userLogin(String email, String password) async {
    var url = "https://jafasa.com/stitcher/api/userLogin.php";
    var response = await http
        .post(Uri.parse(url), body: {"email": email, "password": password});
    var data = jsonDecode(response.body);

    if (data == "success") {
      return true;
    } else {
      return false;
    }
  }


  static Future getMarkers() async {
    var url = "https://jafasa.com/stitcher/api/getTailorList.php";
    var response = await http.post(Uri.parse(url));
    var data = jsonDecode(response.body);
    print(data);
    return data;
  }

  static Future getTailorList() async {
    var url = "https://jafasa.com/stitcher/api/getTailorList.php";
    var response = await http.post(Uri.parse(url));
    var data = jsonDecode(response.body);
    print(data);
    return data;
  }

  static Future userRegistration(
      String name, String email, String password, String contact) async {
    var url = "https://jafasa.com/stitcher/api/registerUser.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
      "email": email,
      "password": password,
      "contact": contact
    });
    var data = jsonDecode(response.body);

    if (data == "success") {
      return true;
    } else {
      return false;
    }
  }

  static Future getuserProfile(String email) async {
    var url = "https://jafasa.com/stitcher/api/getProfile.php";
    var response = await http.post(Uri.parse(url), body: {"email": email});
    var data = jsonDecode(response.body);
    print(data);
    return data;
  }

  static Future gettailorTracker(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString("email")!;
    var url = "https://jafasa.com/stitcher/api/tailorTracker.php";
    var response = await http.post(Uri.parse(url), body: {"email": email});
    var data = jsonDecode(response.body);
    print(data);
    return data;
  }

  static Future getTailorCloth(String tailor_id) async
  {
     var url = "https://jafasa.com/stitcher/api/getTailorCloth.php";
     var response = await http.post(Uri.parse(url), body: {"tailor_id":tailor_id});
     var data = jsonDecode(response.body);

     print(data);
     return data;
  }
}
