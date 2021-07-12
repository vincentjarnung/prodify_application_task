import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prodify_application_task/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseServices {
  String path = "http://app.bookmyfood.se:8085";

  Future<List?> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    if (token != null) {
      var response = await http.post(
        Uri.parse("$path/api/foodie/offers"),
        headers: <String, String>{
          'accept': 'application/json; charset=UTF-8',
          'Authorization': token,
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "ne-latitude": 0,
          "ne-longitude": 0,
          "sw-latitude": 0,
          "sw-longitude": 0,
          "user-latitude": 0,
          "user-longitude": 0
        }),
      );

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        List content = data["response_data"];
        return content;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<Map?> getDish(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    if (token != null) {
      var response = await http.get(
        Uri.parse("$path/api/kitchen/offer/$id"),
        headers: <String, String>{
          'accept': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        Map content = data["response_data"];
        return content;
      } else {
        print(response.statusCode);
        return null;
      }
    } else {
      print('token wrong');
      return null;
    }
  }
}
