import 'package:flutter/material.dart';
import 'package:test1/widgets/text/smail_text.dart';
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

        child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width*0.06,
            ),
            Icon(icon),
            SizedBox(
              width: width*0.06,
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
        ));
  }
}
