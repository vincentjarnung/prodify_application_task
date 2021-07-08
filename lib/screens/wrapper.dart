import 'package:flutter/material.dart';
import 'package:prodify_application_task/models/user.dart';

import 'package:prodify_application_task/screens/authentication/auth_page.dart';
import 'package:prodify_application_task/screens/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Currently doing nothing
class Wrapper extends StatefulWidget {
  @override
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_WrapperState>()!.restartApp();
  }

  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Key key = UniqueKey();
  bool _isLoggedIn = false;

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loggedInUser = prefs.getString('user');

    if (loggedInUser != null) {
      _isLoggedIn = true;
    }
    return _isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // Here I would check if an user exist and then send them to the correct page

    /* AuthProvider _authProvider = AuthProvider();

    if (_authProvider.isAuthenticated) {
      return LandingPage();
    } else {
      return AuthPage();
    } */
  }
}
