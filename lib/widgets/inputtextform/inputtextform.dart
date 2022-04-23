import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors/colors.dart';


class InPutTextForm extends StatelessWidget {
  IconData icon;
  Color color;
  Color hintcolor;
  String hintText;
  bool isPassword;
  TextEditingController textEditingController;
  InPutTextForm(
      {Key? key,
        this.isPassword=false,
      required this.icon,
      required this.hintcolor,
      required this.hintText,
      required this.color,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.only(left: 10, right: 10),

      child: TextFormField(

        style: TextStyle(
            color:color
        ),
        obscureText: isPassword,

        controller: textEditingController,
        decoration: InputDecoration(

            enabledBorder:OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.grey[800]!,width: 1 ),
            ),
          border:  OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey[800]!,width: 1),
          ),
          labelStyle:  TextStyle(color: hintcolor),
          labelText: hintText.tr,
          prefixIcon: Padding(
            padding:
            EdgeInsets.only(), // add padding to adjust icon
            child: Icon(
              icon,
              color: AppColors.purple_icon,
            ),
          ),
        ),
      ),
    );
  }
}
