import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/landing_page.dart';
import 'package:prodify_application_task/sevices/auth_services.dart';
import 'package:prodify_application_task/shared/custom_text_field.dart';
import 'package:prodify_application_task/shared/rounded_button.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthServices _authServices = AuthServices();
  final _formKey = GlobalKey<FormState>();
  // Validates email and password
  RegExp _emailVal = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  RegExp _passwordVal = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');

  String _name = '';
  String _email = '';
  String _password = '';

  String _errorText = '';

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Register',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            color: Theme.of(context).primaryColor,
            hintText: 'Name',
            prefixIconData: Icons.person,
            obscureText: false,
            onChanged: (val) {
              _name = val;
            },
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            isEmail: false,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
            textInputAction: TextInputAction.next,
            focusNode: _nameFocusNode,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            color: Theme.of(context).primaryColor,
            hintText: 'Email',
            prefixIconData: Icons.email,
            obscureText: false,
            onChanged: (val) {
              _email = val;
            },
            validator: (val) {
              if (!_emailVal.hasMatch(val!)) {
                return "Must contain one capital charakter and one number";
              } else {
                return null;
              }
            },
            isEmail: true,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            textInputAction: TextInputAction.next,
            focusNode: _emailFocusNode,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            color: Theme.of(context).primaryColor,
            hintText: 'Password',
            prefixIconData: Icons.password,
            obscureText: true,
            onChanged: (val) {
              _password = val;
            },
            validator: (val) {
              if (val!.length < 6) {
                return "Must contain at least 6 characters";
              } else if (!_passwordVal.hasMatch(val)) {
                return 'Must contain at least one capital charakter and one number';
              } else {
                return null;
              }
            },
            isEmail: false,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
            },
            textInputAction: TextInputAction.next,
            focusNode: _passwordFocusNode,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            color: Theme.of(context).primaryColor,
            hintText: 'Repeat Password',
            prefixIconData: Icons.password,
            obscureText: true,
            onChanged: (val) {},
            validator: (val) {
              if (!(_password == val!)) {
                return 'Passwords do not match';
              } else {
                return null;
              }
            },
            isEmail: false,
            onEditingComplete: _register,
            textInputAction: TextInputAction.done,
            focusNode: _confirmPasswordFocusNode,
          ),
          Text(
            _errorText,
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(
            height: 40,
          ),
          RoundedButton(
            backroundColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).accentColor,
            text: 'Register',
            onClick: _register,
          ),
          SizedBox(
            height: 20,
          ),
        ],
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

  void _register() async {
    if (_formKey.currentState!.validate()) {
      _onLoading();
      var result = await _authServices.register(_name, _email, _password);

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
