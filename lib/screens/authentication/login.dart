import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/landing_page.dart';
import 'package:prodify_application_task/sevices/auth_services.dart';
import 'package:prodify_application_task/shared/custom_text_field.dart';
import 'package:prodify_application_task/shared/rounded_button.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with TickerProviderStateMixin {
  AuthServices _authServices = AuthServices();

  String _userName = '';
  String _password = '';
  String _errorText = '';

  final _formKey = GlobalKey<FormState>();
  RegExp _passwordVal = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    TextStyle header = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).accentColor);
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
              hintText: 'Username',
              prefixIconData: Icons.text_fields,
              obscureText: false,
              onChanged: (val) {
                _userName = val;
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter a Usename";
                } else {
                  return null;
                }
              },
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              textInputAction: TextInputAction.next,
              focusNode: _emailFocusNode,
              errorStyle: TextStyle(color: Colors.red[300]),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              color: Theme.of(context).accentColor,
              hintText: 'Password',
              prefixIconData: Icons.password,
              obscureText: true,
              onChanged: (val) {
                _password = val;
              },
              validator: (val) {
                if (val!.length < 6) {
                  return "Must contain at least 6 characters";
                } else {
                  return null;
                }
              },
              onEditingComplete: _logIn,
              textInputAction: TextInputAction.done,
              focusNode: _passwordFocusNode,
              errorStyle: TextStyle(color: Colors.red[300]),
            ),
            Text(
              _errorText,
              style: TextStyle(color: Colors.red[300], fontSize: 16),
            ),
            SizedBox(
              height: 30,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoading() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).accentColor,
          ));
        });
  }

  Future _logIn() async {
    if (_formKey.currentState!.validate()) {
      _onLoading();
      var result = await _authServices.login(_userName, _password);

      print(result);
      if (result['success']) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LandingPage()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pop();
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          _errorText = result['msg'];
        });
      }
    }
  }
}
