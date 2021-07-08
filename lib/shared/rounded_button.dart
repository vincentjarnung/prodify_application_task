import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color backroundColor;
  final Color textColor;
  final String text;
  final VoidCallback? onClick;
  final double width;
  final double height;
  final Color? borderColor;

  RoundedButton({
    required this.backroundColor,
    required this.textColor,
    required this.text,
    required this.onClick,
    this.width = 150,
    this.height = 45,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backroundColor),
          overlayColor: MaterialStateProperty.all(
            textColor.withOpacity(0.5),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: borderColor != null
                  ? BorderSide(
                      color: borderColor!,
                      width: 2,
                    )
                  : BorderSide.none,
            ),
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
