import 'package:flutter/material.dart';
import 'package:prodify_application_task/models/user.dart';
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

  String _userName = '';
  String _email = '';
  String _phoneNumber = '';
  String _password = '';

  String _firstName = '';
  String _lastName = '';
  String _address = '';
  String _country = '';
  String _city = '';
  String _zipCode = '';

  String _errorText = '';

  bool _goNext = false;

  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _phoneNumberFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();

  FocusNode _firstNameFocusNode = FocusNode();
  FocusNode _lastNameFocusNode = FocusNode();
  FocusNode _adressFocusNode = FocusNode();
  FocusNode _countryFocusNode = FocusNode();
  FocusNode _cityFocusNode = FocusNode();
  FocusNode _zipCodeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                width: maxWidth / 2.05,
                color: Theme.of(context).primaryColor,
                hintText: 'First Name',
                prefixIconData: Icons.person,
                obscureText: false,
                onChanged: (val) {
                  _firstName = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a name';
                  }
                  return null;
                },
                textInputType: TextInputType.name,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_lastNameFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _firstNameFocusNode,
              ),
              CustomTextField(
                width: maxWidth / 2.05,
                color: Theme.of(context).primaryColor,
                hintText: 'Last Name',
                prefixIconData: Icons.person,
                obscureText: false,
                onChanged: (val) {
                  _lastName = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a name';
                  }
                  return null;
                },
                textInputType: TextInputType.name,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_usernameFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _lastNameFocusNode,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                width: maxWidth / 2.05,
                color: Theme.of(context).primaryColor,
                hintText: 'Username',
                prefixIconData: Icons.text_fields,
                obscureText: false,
                onChanged: (val) {
                  _userName = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a username';
                  }
                  return null;
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _usernameFocusNode,
              ),
              CustomTextField(
                width: maxWidth / 2.05,
                color: Theme.of(context).primaryColor,
                hintText: 'Phone Number',
                prefixIconData: Icons.phone,
                obscureText: false,
                onChanged: (val) {
                  _phoneNumber = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a phone number';
                  }
                  return null;
                },
                textInputType: TextInputType.phone,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _phoneNumberFocusNode,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              CustomTextField(
                width: maxWidth - 10,
                color: Theme.of(context).primaryColor,
                hintText: 'Email',
                prefixIconData: Icons.email,
                obscureText: false,
                onChanged: (val) {
                  _email = val;
                },
                validator: (val) {
                  if (!_emailVal.hasMatch(val!)) {
                    return "Enter a valid Email";
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.emailAddress,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_countryFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _emailFocusNode,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                width: maxWidth / 2.05,
                color: Theme.of(context).primaryColor,
                hintText: 'Country',
                prefixIconData: Icons.flag,
                obscureText: false,
                onChanged: (val) {
                  _country = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a country';
                  }
                  return null;
                },
                textInputType: TextInputType.name,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_cityFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _countryFocusNode,
              ),
              CustomTextField(
                width: maxWidth / 2.05,
                color: Theme.of(context).primaryColor,
                hintText: 'City',
                prefixIconData: Icons.location_city,
                obscureText: false,
                onChanged: (val) {
                  _city = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a city';
                  }
                  return null;
                },
                textInputType: TextInputType.name,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_adressFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _cityFocusNode,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                width: maxWidth / 1.65,
                color: Theme.of(context).primaryColor,
                hintText: 'Adress',
                prefixIconData: Icons.house,
                obscureText: false,
                onChanged: (val) {
                  _address = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter an adress';
                  }
                  return null;
                },
                textInputType: TextInputType.streetAddress,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_zipCodeFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _adressFocusNode,
              ),
              CustomTextField(
                width: maxWidth / 2.6 - 5,
                color: Theme.of(context).primaryColor,
                hintText: 'Zip Code',
                prefixIconData: Icons.location_city,
                obscureText: false,
                onChanged: (val) {
                  _zipCode = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter a zip code';
                  }
                  return null;
                },
                textInputType: TextInputType.number,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _zipCodeFocusNode,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              CustomTextField(
                width: maxWidth - 10,
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
                  } else {
                    return null;
                  }
                },
                onEditingComplete: () {
                  FocusScope.of(context)
                      .requestFocus(_confirmPasswordFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _passwordFocusNode,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              CustomTextField(
                width: maxWidth - 10,
                color: Theme.of(context).primaryColor,
                hintText: 'Confirm Password',
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
                onEditingComplete: _register,
                textInputAction: TextInputAction.done,
                focusNode: _confirmPasswordFocusNode,
              ),
            ],
          ),
          Text(
            _errorText,
            style: TextStyle(color: Colors.red),
          ),
          RoundedButton(
              backroundColor: Theme.of(context).primaryColor,
              textColor: Theme.of(context).accentColor,
              text: 'Register',
              onClick: _register),
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

      var result = await _authServices.register(
          firstName: _firstName.trimRight(),
          lastName: _lastName.trimRight(),
          phoneNumber: _phoneNumber.trimRight(),
          country: _country.trimRight(),
          city: _city.trimRight(),
          address: _address.trimRight(),
          zipCode: _zipCode.trimRight(),
          userName: _userName.trimRight(),
          email: _email.trimRight(),
          password: _password.trimRight());

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
