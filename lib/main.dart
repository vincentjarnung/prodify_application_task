import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:prodify_application_task/screens/authentication/auth_page.dart';
import 'package:prodify_application_task/screens/landing_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFF8F2ED),
  ));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF457b9d),
        accentColor: Color(0xFFF8F2ED),
      ),
      home: token == null ? AuthPage() : LandingPage(),
    ),
  );
}
