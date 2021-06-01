import 'package:flutter/material.dart';
import 'package:smart_meet/widgets/custom_stepper.dart';

class MaskDetectionStep4 extends StatelessWidget {
  static final id = '/mask_detection_step2';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Mask Detection Step'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),
          CustomStepper(
            stepNo: 4,
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              'Make Sure to wear a Mask and put your Face infront of Thermal Camera',
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
