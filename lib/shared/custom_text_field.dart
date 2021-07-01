import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Color color;
  final double height;
  final double width;
  final String hintText;
  final IconData prefixIconData;
  final bool obscureText;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final bool isEmail;
  final VoidCallback onEditingComplete;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final TextStyle? errorStyle;

  CustomTextField(
      {this.height = 70,
      this.width = 300,
      required this.color,
      required this.hintText,
      required this.prefixIconData,
      required this.obscureText,
      required this.onChanged,
      required this.validator,
      required this.isEmail,
      required this.onEditingComplete,
      required this.textInputAction,
      required this.focusNode,
      this.errorStyle});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = false;
  IconData visability = Icons.visibility_off;
  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        focusNode: widget.focusNode,
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: widget.validator,
        onChanged: widget.onChanged,
        obscureText: _isObscure,
        cursorColor: widget.color,
        style: TextStyle(
          color: widget.color,
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          errorStyle: widget.errorStyle,
          labelStyle: TextStyle(color: widget.color),
          focusColor: widget.color,
          filled: true,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.color),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.color),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.color),
          ),
          labelText: widget.hintText,
          prefixIcon: Icon(
            widget.prefixIconData,
            size: 18,
            color: widget.color,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (_isObscure) {
                        _isObscure = false;
                        visability = Icons.visibility;
                      } else {
                        _isObscure = true;
                        visability = Icons.visibility_off;
                      }
                    });
                  },
                  icon: Icon(
                    visability,
                    size: 25,
                    color: widget.color,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
