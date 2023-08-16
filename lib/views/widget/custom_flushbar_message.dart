// ignore_for_file: depend_on_referenced_packages

import 'package:another_flushbar/flushbar_route.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomFlushBarMessage {
  static flushBarSuccessMsg(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        titleColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        reverseAnimationCurve: Curves.easeOut,
        backgroundColor: Colors.green,
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        icon: const Icon(
          Icons.check,
          size: 28,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

  static flushBarErrorMsg(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.easeInExpo,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        titleColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        reverseAnimationCurve: Curves.easeInCubic,
        backgroundColor: Colors.red,
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 20),
      )..show(context),
    );
  }
}
