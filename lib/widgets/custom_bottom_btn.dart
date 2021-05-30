import 'package:flutter/material.dart';

class CustomBottomBtn extends StatelessWidget {
  final String text;
  final Color buttonTextcolor;
  final Color buttonColor;

  const CustomBottomBtn({
    Key key,
    @required this.text,
    @required this.buttonTextcolor,
    @required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 193,
      height: 50,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.lightBlueAccent,
          width: 2,
        ),
        color: buttonColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: buttonTextcolor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
