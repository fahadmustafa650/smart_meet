import 'package:flutter/material.dart';

class CustomOnboardingScreen extends StatelessWidget {
  final String heading;
  final String para;
  CustomOnboardingScreen({
    Key key,
    @required this.heading,
    @required this.para,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          heading,
          style: TextStyle(
              fontFamily: 'NunitoBold', fontSize: 24, color: Color(0xff6D6D6D)),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 280,
          height: 80,
          child: Text(
            para == null ? '' : para,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff6D6D6D),
              fontFamily: 'NunitoReg',
              fontSize: 14,
              // fontWeight: FontWeight.w100,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }
}
