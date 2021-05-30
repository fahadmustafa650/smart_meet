import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  final bgColor;
  final title;
  final textIconColor;
  final iconData;
  const InfoPanel(
      {@required this.bgColor,
      @required this.title,
      @required this.textIconColor,
      @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 50,
            color: textIconColor,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: textIconColor,
                fontSize: 20,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
