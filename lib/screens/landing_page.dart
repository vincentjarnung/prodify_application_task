import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/authentication/auth_page.dart';
import 'package:prodify_application_task/screens/info_page.dart';
import 'package:prodify_application_task/screens/tab_views.dart/all.dart';
import 'package:prodify_application_task/screens/tab_views.dart/deserts.dart';
import 'package:prodify_application_task/screens/tab_views.dart/mains.dart';
import 'package:prodify_application_task/screens/tab_views.dart/snacks.dart';
import 'package:prodify_application_task/sevices/auth_services.dart';
import 'package:prodify_application_task/sevices/database_services.dart';
import 'package:prodify_application_task/shared/gridview_item.dart';
import 'package:prodify_application_task/shared/listview_item.dart';
import 'package:prodify_application_task/shared/rounded_button.dart';
import 'package:prodify_application_task/shared/wave_painter.dart';
import 'package:prodify_application_task/shared/wavy_bottom.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  AuthServices _authServices = AuthServices();
  DatabaseServices _databaseServices = DatabaseServices();
  List<Widget> _list = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: CustomPaint(
              size: Size(100, 80),
              painter: WavePainter(context: context),
              child: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  'Menu',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        _logoutPopUp();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).accentColor,
                      ))
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Container(
                    height: 50,
                    child: TabBar(
                      labelColor: Theme.of(context).primaryColor,
                      indicatorColor: Theme.of(context).primaryColor,
                      tabs: [
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              'All',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              'Snacks',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              'Mains',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              'Deserts',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(children: [
            AllView(),
            SnacksView(),
            MainsView(),
            DessertsView()
          ])),
    );
  }

  void _logoutPopUp() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Are you sure that you want to log out?',
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundedButton(
                            borderColor: Theme.of(context).primaryColor,
                            width: 90,
                            height: 40,
                            backroundColor: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColor,
                            text: 'No',
                            onClick: () {
                              Navigator.of(context).pop();
                            }),
                        RoundedButton(
                            width: 90,
                            height: 40,
                            backroundColor: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).accentColor,
                            text: 'Yes',
                            onClick: () {
                              _authServices.logOut().whenComplete(() =>
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => AuthPage()),
                                      (route) => false));
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _filterPopUp() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Filters',
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButton(
                    items: [],
                    hint: Text('Diet'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedButton(
                        borderColor: Theme.of(context).primaryColor,
                        width: 90,
                        height: 40,
                        backroundColor: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColor,
                        text: 'Back',
                        onClick: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      RoundedButton(
                        width: 90,
                        height: 40,
                        backroundColor: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).accentColor,
                        text: 'Apply',
                        onClick: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
