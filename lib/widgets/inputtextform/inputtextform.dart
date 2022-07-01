import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors/colors.dart';

class InputTextForm extends StatelessWidget {
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
      required this.icon,
      required this.textInputType,
      required this.hintcolor,
      required this.hintText,
      required this.color,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 65,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 12),
      child: TextFormField(
        maxLines: null,
        expands: true,
       // textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        style: TextStyle(color: color,fontSize: 22),
        obscureText: isPassword,
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue, width: 1),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
          ),
          labelStyle: TextStyle(color: hintcolor,fontSize: 18),
          labelText: hintText.tr,

          prefixIcon: Padding(
            padding: EdgeInsets.only(), // add padding to adjust icon
            child: Icon(
              icon,
              size: 28,
              color: AppColors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
