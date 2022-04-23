import 'package:flutter/cupertino.dart';

class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double containerSize;
  final double iconSize;
  final Color backgruondcolor;
  AppIcons(
      {Key? key,
      required this.icon,
      this.iconColor = const Color(0xFF8f837f),
      this.containerSize = 40,
      this.iconSize = 18,
      this.backgruondcolor = const Color(0xFFf7f6ff), })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
     // color: backgruondcolor,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerSize / 2),
          color: backgruondcolor),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
