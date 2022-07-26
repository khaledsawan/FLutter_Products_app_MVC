import 'package:flutter/material.dart';
import '../colors/colors.dart';
class Themes {
  static final light = ThemeData.light().copyWith(
  backgroundColor: Colors.white,
  primaryColor: AppColors.mainColor,
  buttonColor: Colors.blue,
  );
  static final dark = ThemeData.dark().copyWith(
  backgroundColor: Colors.black,
    primaryColor: Colors.purple,

    buttonColor: Colors.red,
  );
  }
