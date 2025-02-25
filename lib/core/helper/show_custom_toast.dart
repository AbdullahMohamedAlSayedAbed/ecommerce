import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { success, error, warning }

void showCustomToast(String message, ToastType type) {
  Color bgColor;

  switch (type) {
    case ToastType.success:
      bgColor = Colors.green;
      break;
    case ToastType.error:
      bgColor = Colors.red;
      break;
    case ToastType.warning:
      bgColor = Colors.orange;
      break;
  }

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: bgColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
