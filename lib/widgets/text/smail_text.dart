import 'package:flutter/material.dart';

class SmailText extends StatelessWidget {
  final String textbody;
  Color? color;
  double? size;
  int? maxline;
  double? height;

  SmailText(
      {Key? key,
      required this.textbody,
      this.color = const Color(0xFF89dad0),
      this.size = 12,
      this.maxline = 1,
      this.height=0.6})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      textbody,
      maxLines: maxline,

      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
