import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const mapApiKey = "AIzaSyAofr6MTAVjER_EanHr_GFsMGzOcehOeUU";
const darkBlueColor = Colors.blue;
const kPrimaryColor = Color(0xffE5E5E5);

///LoginScreen Styles
const loginTextFieldsStyles =
    TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
const headingRegister = Text(
  'Sign Up',
  style: TextStyle(
    color: Colors.lightBlueAccent,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  ),
);
const kAnimationDuration = Duration(milliseconds: 200);

/// Custom Stepper Class
const kStepperTextStyle = TextStyle(
  color: Colors.white,
);

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
);
