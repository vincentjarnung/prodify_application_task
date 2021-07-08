import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:prodify_application_task/screens/authentication/auth_page.dart';
import 'package:prodify_application_task/screens/landing_page.dart';
import 'package:prodify_application_task/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFF8F2ED),
  ));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString('user');
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF457b9d),
        accentColor: Color(0xFFF8F2ED),
      ),
      home: user == null ? AuthPage() : LandingPage(),
    ),
  );
}

// Currently doing nothing
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF606c38),
        accentColor: Color(0xFFF8F2ED),
      ),
      // Color(0xFFfefae0)- really warm white
      home: Wrapper(),
    );
  }
}
