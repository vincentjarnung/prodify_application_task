import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prodify_application_task/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  String url = "https://prodifytask.herokuapp.com/";

  Future login(email, password) async {
    print('start');
    var response = await http.post(
      Uri.parse(url + "authenticate"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as Map;
      String token = result['token'];
      String name = await getName(token);

      User loggedInUser = User(name: name, email: email, token: token);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('user', jsonEncode(User.fromJson(loggedInUser.toJson())));

      return result;
    } else if (response.statusCode == 403) {
      var result = jsonDecode(response.body) as Map;
      print(result['msg']);
      return result;
    } else {
      return {"success": false, "msg": "Unknown error"};
    }
  }

  Future register(name, email, password) async {
    if (!await uniqueEmail(email)) {
      return {'success': false, 'msg': 'Email already exists'};
    }
    if (!await uniqueName(name)) {
      return {'success': false, 'msg': 'Name already exists'};
    }
    var response = await http.post(
      Uri.parse(url + "adduser"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'name': name, 'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as Map;

      var data = await login(email, password);

      String token = data['token'];

      print(token);

      User loggedInUser = User(name: name, email: email, token: token);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('user', jsonEncode(User.fromJson(loggedInUser.toJson())));
      return result;
    } else {
      print(response.statusCode);
      return {"success": false, "msg": "Unknown error"};
    }
  }

  Future<String> getName(String token) async {
    var response = await http.get(
      Uri.parse(url + "getname"),
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
      Uri.parse(url + "uniqueemail"),
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
      Uri.parse(url + "uniquename"),
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
