import 'package:flutter/material.dart';
import 'package:test1/widgets/text/smail_text.dart';
import '../../utils/colors/colors.dart';
import '../App_Icons/app_icons.dart';
import '../text/big_text.dart';

class Icon_Than_Text extends StatelessWidget {
  IconData icon;
  Color color;
  Color iconColor;
  String text;
  Icon_Than_Text(
      {Key? key, this.iconColor=Colors.black45, required this.icon, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width*0.04,
            ),
            Icon(icon,size: 28,color: iconColor,),
            SizedBox(
              width: width*0.04,
            ),
            SmailText(
              textbody: text,
              color: color,
              size: 18,
            ),
            SizedBox(
              width: width*0.1,
            ),
          ],
        ),

      ],
    );
  }
}
