import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prodify_application_task/models/user.dart';
import 'package:prodify_application_task/screens/authentication/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  String path = "http://app.bookmyfood.se:8085";

  Future login(userName, password) async {
    var response = await http.post(
      Uri.parse("http://app.bookmyfood.se:8085/api/accounts/login"),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, dynamic>{
        'password': password,
        'username': userName,
      }),
    );

    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      if (data["error"] == null) {
        print(data["content"]);
        var account = data["content"];
        //int accountID = account["account-id"];
        //List accountType = account["account-type"];
        String token = account["token"];

        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('token', token);

        return {'success': true, 'acount-id': account["account-id"]};
      } else {
        return {'success': false, 'msg': data["error"]};
      }
    } else if (response.statusCode == 404) {
      Map data = json.decode(response.body);
      Map error = data["error"];
      return {'success': false, 'msg': error["resolution"]};
    } else if (response.statusCode == 401) {
      Map data = json.decode(response.body);
      Map error = data["error"];
      return {'success': false, 'msg': error["resolution"]};
    } else {
      print('Error fetching data, code: ${response.statusCode}');
      return {'success': false, 'msg': 'Failed connecting to server'};
    }
  }

  Future<Map<String, dynamic>> register({
    required String address,
    required String city,
    required String country,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String phoneNumber,
    required String userName,
    required String zipCode,
  }) async {
    var response = await http.post(Uri.parse(path + "/api/accounts"),
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          "address": address,
          "city": city,
          "country": country,
          "email-id": email,
          "first-name": firstName,
          "is-foodie-account": true,
          "is-kitchen-account": true,
          "last-name": lastName,
          "password": password,
          "phone-number": phoneNumber,
          "username": userName,
          "zip-code": zipCode
        }));

    print(json.encode({
      "address": address,
      "city": city,
      "country": country,
      "email-id": email,
      "first-name": firstName,
      "is-foodie-account": true,
      "is-kitchen-account": true,
      "last-name": lastName,
      "password": password,
      "phone-number": phoneNumber,
      "username": userName,
      "zip-code": zipCode
    }));

    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      if (data["error"] == null) {
        Map account = data["content"];

        print(login(userName, password));

        return {'success': true, 'acount-id': account["acount-id"]};
      } else {
        return {'success': false, 'msg': data["error"]};
      }
    } else {
      print('Error fetching data, code: ${response.statusCode}');
      return {'success': false, 'msg': 'Failed connecting to server'};
    }
  }

  Future<String> getName(String token) async {
    var response = await http.get(
      Uri.parse(path + "getname"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map;

      return data['name'];
    } else {
      var data = jsonDecode(response.body) as Map;
      return data['name'];
    }
  }

  Future<bool> uniqueEmail(String email) async {
    bool unique = false;
    var responseEmail = await http.get(
      Uri.parse(path + "uniqueemail"),
      headers: <String, String>{
        'Email': '$email',
      },
    );
    if (responseEmail.statusCode == 200) {
      var data = jsonDecode(responseEmail.body) as Map;
      if (data['success']) {
        return true;
      }
    } else {
      var data = jsonDecode(responseEmail.body) as Map;
      print(data['msg']);
    }

    return unique;
  }

  Future<bool> uniqueName(String name) async {
    bool unique = false;

    var responseName = await http.get(
      Uri.parse(path + "uniquename"),
      headers: <String, String>{
        'Name': '$name',
      },
    );
    if (responseName.statusCode == 200) {
      var data = jsonDecode(responseName.body) as Map;
      if (data['success']) {
        unique = true;
      }
    } else {
      var data = jsonDecode(responseName.body) as Map;
      print(data['msg']);
    }
    return unique;
  }

  Future logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
