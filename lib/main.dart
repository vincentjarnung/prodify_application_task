import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/authentication/auth_page.dart';
import 'package:prodify_application_task/screens/landing_page.dart';
import 'package:prodify_application_task/screens/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF606c38),
        accentColor: Color(0xFFfefae0),
      ),
      /* Would like to send this to a wrapper class that sends the user either 
      directly to the landing page if the user exist, or the auth page if 
      it is a new user. With help from the provider package. */
      home: Wrapper(),
    );
  }
}
