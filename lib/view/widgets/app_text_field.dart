import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final bool obscureText;
  final TextEditingController aobController;

  const AppTextField({
    Key key,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.aobController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: aobController,
      obscureText: obscureText,
      decoration: InputDecoration(
        // suffixIcon: icon,
        hintText: hintText,
        focusColor: Colors.black,
        fillColor: Colors.black,
        hoverColor: Colors.black,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
    );
  }
}
