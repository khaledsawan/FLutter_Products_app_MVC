import 'package:flutter/material.dart';
import '../../utils/colors/colors.dart';
import '../App_Icons/app_icons.dart';
import '../text/big_text.dart';

class Icon_Than_Text extends StatelessWidget {
  IconData icon;
  Color color;
  String text;
  Icon_Than_Text(
      {Key? key, required this.icon, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
       border: Border.all(width: 1,color:color)
      ),
        child: Row(
      children: [
        SizedBox(
          width: 15,
        ),
        AppIcons(
          icon: icon,
          containerSize: 40,
          iconSize: 30,
          backgruondcolor: AppColors.backGruond,
          iconColor: color,
        ),
        SizedBox(
          width: 15,
        ),
        BigText(
          fontStyle: FontStyle.normal,
          textbody: text,
          color: color,
        ),
      ],
    ));
  }
}
