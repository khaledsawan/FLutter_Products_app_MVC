import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void ShowCustomSnackparGreen(String massage, String title,
    {Color backgruond_color = Colors.green, Color textcolor = Colors.white}) {
  Get.snackbar(title, massage,
      backgroundColor: backgruond_color, colorText: textcolor);
}
