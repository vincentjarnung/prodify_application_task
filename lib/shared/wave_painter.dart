import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final BuildContext context;

  WavePainter({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()
      ..color = Theme.of(context).primaryColor
      ..strokeWidth = 15;

    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height - (40), size.width / 2.1, size.height - 47);

    path.quadraticBezierTo(size.width - (size.width / 3.8), size.height - (55),
        size.width, size.height - (40));

    path.lineTo(size.width, size.height - 20);

    path.lineTo(size.width, 0.0);
    canvas.drawPath(path, paint);
    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
