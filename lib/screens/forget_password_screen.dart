import 'package:flutter/material.dart';
import 'package:smart_meet/screens/otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static final id = '/forget_password_screen';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lock, size: 60, color: Colors.white),
          SizedBox(
            height: 15,
          ),
          topHeading(screenWidth),
          SizedBox(
            height: 20,
          ),
          emailField(screenWidth),
          SizedBox(
            height: 20,
          ),
          sendBtn(context, screenWidth)
        ],
      ),
    );
  }

  Container topHeading(double screenWidth) {
    return Container(
      width: screenWidth * 0.4,
      child: Text(
        'Forgot your Password?',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          //fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  Card emailField(double screenWidth) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Type Your Email',
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
      ),
    );
  }

  GestureDetector sendBtn(BuildContext context, double screenWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OtpScreen.id);
      },
      child: Container(
        width: screenWidth * 0.35,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white, width: 1.5),
            color: Colors.blue[700]),
        child: Center(
          child: Text(
            'Send',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
