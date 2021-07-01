import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prodify_application_task/screens/authentication/login.dart';
import 'package:prodify_application_task/screens/authentication/register.dart';
import 'package:prodify_application_task/shared/rounded_button.dart';
import 'package:prodify_application_task/shared/wavy_bottom.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  double _multiplierTop = 0.65;
  bool _isRegister = false;
  bool _isLogIn = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidht = MediaQuery.of(context).size.width;

    double statusBarHeight = MediaQuery.of(context).padding.top;

    TextStyle header = TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFFfefae0));
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: WavyBottom(),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastOutSlowIn,
                    height: maxHeight * _multiplierTop,
                    width: maxWidht,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: !_isLogIn
                        ? Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: statusBarHeight + 20,
                                ),
                                Text(
                                  'Already a user?',
                                  style: header,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RoundedButton(
                                  backroundColor: Theme.of(context).accentColor,
                                  textColor: Theme.of(context).primaryColor,
                                  text: 'Log In',
                                  onClick: _animatedTransition,
                                )
                              ],
                            ),
                          )
                        : LogIn()),
              ),
              !_isRegister
                  ? Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'New user?',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        RoundedButton(
                          backroundColor: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).accentColor,
                          text: 'Register',
                          onClick: _animatedTransition,
                        ),
                      ],
                    )
                  : Register()
            ],
          ),
        ),
      ),
    );
  }

  // Handels the transition from login to register
  void _animatedTransition() {
    setState(() {
      if (!_isRegister && _isLogIn) {
        _multiplierTop = 0.27;
        _isRegister = true;
        _goRegister();
      } else if (_isRegister && !_isLogIn) {
        _multiplierTop = 0.65;
        _isLogIn = true;
        _goLogin();
      }
    });
  }

  // Changing the login/register widget when the transition almost is done
  Future _goRegister() async {
    await Future.delayed(Duration(milliseconds: 900));
    setState(() {
      _isLogIn = false;
    });
  }

  Future _goLogin() async {
    await Future.delayed(Duration(milliseconds: 900));
    setState(() {
      _isRegister = false;
    });
  }
}
