import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/authentication/auth_page.dart';
import 'package:prodify_application_task/screens/landing_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* Here I would check if an user exist and then send them to the correct page

    final user = Provider.of<User>(context);

    if (user = null) {
      return AuthPage();
    } else {
      return LandingPage();
    }*/
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AuthPage()));
              },
              child: Text(
                'Log In or Register',
                textScaleFactor: 1.5,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LandingPage()));
              },
              child: Text(
                'Landing Page',
                textScaleFactor: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
