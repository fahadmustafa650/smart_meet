import 'package:flutter/material.dart';
import 'package:smart_meet/widgets/custom_stepper.dart';

import 'temperature_detector_step2.dart';

class ScanQRCodeStep1 extends StatelessWidget {
  static final id = '/scan_qrcode_step1';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('QR Code Vertification Step'),
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
              stepNo: 1,
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                'Scan QR Code with Visitor Device',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Image(
              width: screenWidth * 0.5,
              height: screenHeight * 0.35,
              image: AssetImage('assets/images/qr_code_img.png'),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
