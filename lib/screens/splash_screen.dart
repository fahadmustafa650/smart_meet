import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screens.dart';

class CustomSplashScreen extends StatefulWidget {
  static final id = '/custom_splash_id';
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _opacity = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {
        _opacity = _controller.value;
      });
    });
    Timer(Duration(seconds: 4),
        () => Navigator.pushNamed(context, OnBoardingScreens.id));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff012b80).withOpacity(_opacity),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
                opacity: _opacity,
                child: Image(image: AssetImage('assets/images/logo.png'))),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
