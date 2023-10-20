import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg, backgroundColor: Colors.red, toastLength: Toast.LENGTH_SHORT);
  }

  static fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flashBarErrorMessage(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          message: msg,
          duration: const Duration(seconds: 3),
          title: msg,
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: Colors.red,
        )..show(context));
  }
}
