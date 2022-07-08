import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors/colors.dart';

class InputTextForm extends StatelessWidget {
  int maxLine;
  double height;
  IconData icon;
  Color color;
  Color hintcolor;
  String hintText;
  bool isPassword;
  TextInputType textInputType;
  TextEditingController textEditingController;
  InputTextForm(
      {Key? key,
      this.isPassword = false,
      this.maxLine = 1,
      required this.icon,
      this.height = 65,
      required this.textInputType,
      required this.hintcolor,
      required this.hintText,
      required this.color,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 12),
      child: TextFormField(
        maxLines: 100,
        // expands: true,
        //textInputAction: TextInputAction.newline,
        keyboardType: textInputType,
        // minLines: 1,
        style: TextStyle(color: AppColors.titleColor, fontSize: 22),
        obscureText: isPassword,
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue, width: 1),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
          ),
          labelStyle: TextStyle(color: hintcolor, fontSize: 18),
          labelText: hintText.tr,
          prefixIcon: Icon(
            icon,
            size: 28,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
