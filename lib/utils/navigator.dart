// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void navigateBack() {
  Get.back();
}

void navigateTo(Widget screen) {
  Get.to(screen,
      transition: Transition.fadeIn, duration: const Duration(microseconds: 1));
}

void navigateOff(Widget screen) {
  Get.offAll(screen,
      arguments: {1},
      transition: Transition.fadeIn,
      duration: const Duration(microseconds: 1));
}
