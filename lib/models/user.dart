import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String token;

  User({required this.name, required this.email, required this.token});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        token = json['token'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'token': token};
}
