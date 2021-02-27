import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

/// Metodo que arroja un toast para informar al usuario
///
void showToastMessage({@required aobContext, @required asMessage}) {
  Toast.show(asMessage, aobContext,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
}
