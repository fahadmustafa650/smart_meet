import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  final title;
  final textIconColor;
  final iconData;
  const InfoPanel(
      {@required this.title,
      @required this.textIconColor,
      @required this.iconData});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.2,
      height: screenWidth * 0.2,
      child: Card(
        elevation: 7,
        margin: EdgeInsets.only(top: 25),
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
            FittedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textIconColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
    );
  }
}
