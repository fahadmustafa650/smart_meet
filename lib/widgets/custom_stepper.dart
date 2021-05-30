import 'package:flutter/material.dart';
import 'package:smart_meet/Constants/constants.dart';

const stepperColor = Colors.lightBlueAccent;

class CustomStepper extends StatefulWidget {
  final int stepNo;
  CustomStepper({this.stepNo});

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _stepNo;
  Color step2Color;
  Color step3Color;
  Color step4Color;

  @override
  void initState() {
    super.initState();
    _stepNo = widget.stepNo;
    getStepsColor();
  }

  void getStepsColor() {
    switch (_stepNo) {
      case 4:
        {
          step4Color = stepperColor;
          step3Color = stepperColor;
          step2Color = stepperColor;
          break;
        }
      case 3:
        {
          step3Color = stepperColor;
          step2Color = stepperColor;
          break;
        }
      case 2:
        {
          step2Color = stepperColor;
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatarWidget(
          text: '1',
          circleColor: stepperColor,
        ),
        LineBetween(lineColor: step2Color),
        CircleAvatarWidget(
          text: '2',
          circleColor: step2Color,
        ),
        LineBetween(
          lineColor: step3Color,
        ),
        CircleAvatarWidget(
          text: '3',
          circleColor: step3Color,
        ),
        LineBetween(
          lineColor: step4Color,
        ),
        CircleAvatarWidget(
          text: '4',
          circleColor: step4Color,
        ),
      ],
    );
  }
}

class LineBetween extends StatelessWidget {
  final Color lineColor;

  LineBetween({this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 2.0,
      color: lineColor == null ? Colors.grey : lineColor,
    );
  }
}

class CircleAvatarWidget extends StatelessWidget {
  final String text;
  final Color circleColor;
  CircleAvatarWidget({this.text, this.circleColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: circleColor == null ? Colors.grey : circleColor,
      child: Text(
        text,
        style: kStepperTextStyle,
      ),
    );
  }
}
