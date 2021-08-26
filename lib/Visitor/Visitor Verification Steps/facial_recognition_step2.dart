import 'package:flutter/material.dart';
import 'package:smart_meet/Visitor/Device%20steps/temperature_detector_step2.dart';
import 'package:smart_meet/widgets/custom_stepper.dart';

import 'mask_detection_step4.dart';

class FacialRecognitionStep2 extends StatelessWidget {
  static final id = '/facial_recgonition_step3';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Facial Recognition Step'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.forward, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, TemperatureDetectionStep3.id);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                'Please Click on the Camera & Scan your face',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
