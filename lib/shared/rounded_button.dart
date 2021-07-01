import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color backroundColor;
  final Color textColor;
  final String text;
  final VoidCallback? onClick;
  final double width;
  final double height;

  RoundedButton(
      {required this.backroundColor,
      required this.textColor,
      required this.text,
      required this.onClick,
      this.width = 150,
      this.height = 45});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: backroundColor),
      height: height,
      width: width,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
            (states) => textColor.withOpacity(0.5),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: textColor),
        ),
        onPressed: onClick,
      ),
    );
  }
}
