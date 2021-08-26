import 'package:flutter/material.dart';
import 'package:smart_meet/widgets/custom_stepper.dart';

import 'facial_recognition_step3.dart';

class TemperatureDetectionStep3 extends StatelessWidget {
  static final id = '/temperature_detection_step3';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Temperature Detector Step'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.forward, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, FacialRecognitionStep3.id);
              })
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),
          CustomStepper(
            stepNo: 2,
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              'Put your Face infront of Thermal Camera to detect Temperature',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
