import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color addColors;
  final Color addBackground;

  const DialogButton(
      {Key key, this.text, this.onPressed, this.addColors, this.addBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: addBackground,
      minWidth: 95,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: addColors,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Text(
        text,
        style: TextStyle(fontSize: 10, color: addColors),
      ),
    );
  }
}
