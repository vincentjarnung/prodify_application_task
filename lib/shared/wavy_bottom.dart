import 'package:flutter/material.dart';

class WavyBottom extends CustomClipper<Path> {
  //Optional int to make the waves a little less aggressive
  final int level;

  WavyBottom({this.level = 0});
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - (30 - level * 2));
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2.1,
        size.height - (25 - level * 2));

    path.quadraticBezierTo(
        size.width - (size.width / 3.8),
        size.height - (55 - level * 4),
        size.width,
        size.height - (20 - level * 2));

    path.lineTo(size.width, size.height - 20);

    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
