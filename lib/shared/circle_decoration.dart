import 'package:flutter/material.dart';

class CircleDecoration extends CustomClipper<Path> {
  //Optional int to make the waves a little less aggressive

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width - (size.width / 1.5), size.height / 2,
        size.width, size.height - 50);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
