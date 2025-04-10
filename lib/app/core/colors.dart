import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppColors {
  const AppColors._();

  static bool isDarkTheme() {
    return Get.isDarkMode;
  }

  static const Color trans = Colors.transparent;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
  static const Color grey = Colors.grey;
  static const Color white = Colors.white;
  static const Color appColor = Color(0xff4d3aa5);
  static const Color appBG = Color(0xffFBFBFB);
}
