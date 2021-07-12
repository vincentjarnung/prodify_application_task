import 'package:flutter/material.dart';

class WavyBottom extends CustomClipper<Path> {
  //Optional int to make the waves a little less aggressive
  final double level;

  WavyBottom({this.level = 0});
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(size.width / 4, size.height - (10 * level),
        size.width / 2.1, size.height - 25);

    path.quadraticBezierTo(size.width - (size.width / 3.8),
        size.height - (55 - (10 * level)), size.width, size.height - (20));

    path.lineTo(size.width, size.height - 20);

    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
