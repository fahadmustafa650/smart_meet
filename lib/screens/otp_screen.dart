import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smart_meet/Constants/constants.dart';

import 'new_password_screen.dart';

class OtpScreen extends StatelessWidget {
  static final id = '/otp_screen';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          "Email Verification",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  'We have sent code to your email',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter your OTP code here",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 25,
              ),
              OtpForm(),
              SizedBox(
                height: 10,
              ),
              buildTimer(),
              SizedBox(
                height: 25,
              ),
              Container(
                // alignment: Alignment.topLeft,
                child: Text(
                  "Didn't receive any code?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
              ),
              resendCodeBtn(),
              SizedBox(
                height: 10,
              ),
              sendBtn(context, screenWidth)
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector sendBtn(BuildContext context, double screenWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewPasswordScreen.id);
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

  GestureDetector resendCodeBtn() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        //alignment: Alignment.topLeft,
        child: Text(
          "Resend a new code",
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildTimer() {
    return TweenAnimationBuilder(
      tween: Tween(begin: 30.0, end: 0.0),
      duration: Duration(seconds: 30),
      builder: (_, value, child) => Text(
        "00:${value.toInt()}",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  //CircleAvatars background Color
  Color circlePinColor1 = Colors.white;
  Color circlePinColor2 = Colors.white;
  Color circlePinColor3 = Colors.white;
  Color circlePinColor4 = Colors.white;
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  void changeCircleColor(FocusNode focusNode) {
    if (focusNode == pin2FocusNode) {
      setState(() {
        circlePinColor1 = darkBlueColor;
      });
    } else if (focusNode == pin3FocusNode) {
      setState(() {
        circlePinColor2 = darkBlueColor;
      });
    } else if (focusNode == pin4FocusNode) {
      setState(() {
        circlePinColor3 = darkBlueColor;
      });
    } else {
      setState(() {
        circlePinColor4 = darkBlueColor;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      setState(() {
        focusNode.requestFocus();
        changeCircleColor(focusNode);
      });

      // Switch(){
      //   case focusNode==
      // }
    }
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: circlePinColor1,
          radius: 30,
          child: TextFormField(
            autofocus: true,
            //obscureText: true,
            style: TextStyle(fontSize: 24, color: Colors.white),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value, pin2FocusNode);
            },
          ),
        ),
        CircleAvatar(
          backgroundColor: circlePinColor2,
          radius: 30,
          child: TextFormField(
            autofocus: true,
            // obscureText: true,
            focusNode: pin2FocusNode,
            style: TextStyle(fontSize: 24, color: Colors.white),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value, pin3FocusNode);
            },
          ),
        ),
        CircleAvatar(
          backgroundColor: circlePinColor3,
          radius: 30,
          child: TextFormField(
            autofocus: true,
            //obscureText: true,
            focusNode: pin3FocusNode,
            style: TextStyle(fontSize: 24, color: Colors.white),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value, pin4FocusNode);
            },
          ),
        ),
        CircleAvatar(
          backgroundColor: circlePinColor4,
          radius: 30,
          child: TextFormField(
            autofocus: true,
            //obscureText: true,
            focusNode: pin4FocusNode,
            style: TextStyle(fontSize: 24, color: Colors.white),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: otpInputDecoration,
            onChanged: (value) {
              if (value.length == 1) {
                pin4FocusNode.unfocus();
                setState(() {
                  circlePinColor4 = darkBlueColor;
                });
                // Then you need to check is the code is correct or not
              }
            },
          ),
        ),
      ],
    );
  }
}
