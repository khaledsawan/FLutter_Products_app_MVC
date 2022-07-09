import 'package:flutter/material.dart';

import '../../utils/colors/colors.dart';
import '../text/smail_text.dart';

class IconsTextWidgets extends StatelessWidget {
  String food_name;
  String location;
  String food_timer;
  IconsTextWidgets(
      {Key? key,
      required this.food_name,
      required this.location,
      required this.food_timer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle_sharp,
              color: AppColors.iconColor1,
            ),
            SmailText(
              maxline: 1,
              textbody: food_name,
              color: AppColors.textColor,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: AppColors.mainColor,
            ),
            SmailText(
              maxline: 1,
              textbody: location,
              color: AppColors.textColor,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              color: AppColors.iconColor2,
            ),
            SmailText(
              maxline: 1,
              textbody: food_timer,
              color: AppColors.textColor,
            ),
          ],
        )
      ],
    );
  }
}
