import 'package:flutter/material.dart';
import '../../utils/colors/colors.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;
  const DescriptionTextWidget({required this.text});
  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > 125) {
      firstHalf = widget.text.substring(0, 125);
      secondHalf = widget.text.substring(125, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: secondHalf.isEmpty
          ? Container(
        margin: EdgeInsets.only(top: 5,bottom: 5),
              child: Text(
              firstHalf,
              style: TextStyle(color: AppColors.textColor,fontSize: 16),
            ))
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                    style: TextStyle(color: AppColors.textColor),
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          flag ? "show more" : "show less",
                          style: TextStyle(color: AppColors.blue),
                        ),
                        Icon(
                          flag ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                          color: AppColors.blue,
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
