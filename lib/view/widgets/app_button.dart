import 'package:app1/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  // variables
  final String text;
  final Function onPressed;
  final double height;
  final double width;
  final double sizeLetter;
  // constructor
  const AppButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.height = 35,
    this.width = 110,
    this.sizeLetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: sizeLetter,
            color: backgroundColor,
          ),
          textAlign: TextAlign.center,
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
