import 'package:flutter/material.dart';

class User {
  final id;
  final String name;
  final String email;
  final String password;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.password});
}
