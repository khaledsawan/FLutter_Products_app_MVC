import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String textbody;
  Color? color;
  double? size;
  double? height;
  FontStyle? fontStyle;
  TextOverflow textOverflow;
  BigText(
      {Key? key,
         this.fontStyle=FontStyle.normal,
      required this.textbody,
      this.color = const Color(0xFF332d2b),
      this.textOverflow = TextOverflow.ellipsis,
        this.height=1.2,
      this.size=20})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      textbody,
      maxLines: 1,
      style: TextStyle(

        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
        fontWeight: FontWeight.w400,
        color: color,
        fontStyle: fontStyle
      ),
      overflow: textOverflow,
    );
  }
}
