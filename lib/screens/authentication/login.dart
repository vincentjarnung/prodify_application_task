import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/landing_page.dart';
import 'package:prodify_application_task/shared/custom_text_field.dart';
import 'package:prodify_application_task/shared/rounded_button.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  RegExp _emailVal = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  RegExp _passwordVal = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    TextStyle header = TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFFfefae0));
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: statusBarHeight + 40,
            ),
            Text(
              'Log In',
              style: header,
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextField(
              color: Theme.of(context).accentColor,
              hintText: 'Email',
              prefixIconData: Icons.email,
              obscureText: false,
              onChanged: (val) {},
              validator: (val) {
                if (!_emailVal.hasMatch(val!)) {
                  return "Must contain one capital charakter and one number";
                } else {
                  return null;
                }
              },
              isEmail: true,
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              textInputAction: TextInputAction.next,
              focusNode: _emailFocusNode,
              errorStyle: TextStyle(color: Colors.red[200]),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              color: Theme.of(context).accentColor,
              hintText: 'Password',
              prefixIconData: Icons.password,
              obscureText: true,
              onChanged: (val) {},
              validator: (val) {
                if (val!.length < 6) {
                  return "Must contain at least 6 characters";
                } else if (!_passwordVal.hasMatch(val)) {
                  return 'Must contain one capital charakter and one number';
                } else {
                  return null;
                }
              },
              isEmail: false,
              onEditingComplete: _logIn,
              textInputAction: TextInputAction.done,
              focusNode: _passwordFocusNode,
              errorStyle: TextStyle(color: Colors.red[200]),
            ),
            SizedBox(
              height: 40,
            ),
            RoundedButton(
              backroundColor: Theme.of(context).accentColor,
              textColor: Theme.of(context).primaryColor,
              text: 'Log In',
              onClick: _logIn,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states) =>
                        Theme.of(context).accentColor.withOpacity(0.1))),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  void _logIn() {
    if (_formKey.currentState!.validate()) {
      /* Here I want to send the data to an api to request a login, if it is 
      succsessfull I can notify the provider so the user automatically get sent
      to the landing page by the wrapper*/
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LandingPage()),
          (Route<dynamic> route) => false);
    }
  }
}
