// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnakBar({required Color color, required String msg, String? title}) {
  return Get.showSnackbar(GetSnackBar(
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    messageText: Text(
      msg,
      style: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
    ),
    snackStyle: SnackStyle.FLOATING,
  ));
}
