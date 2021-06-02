import 'package:flutter/material.dart';
import 'package:smart_meet/models/appointment_request_model.dart';
import 'package:smart_meet/widgets/appointment_request.dart';

class Notifications extends StatelessWidget {
  static final id = '/notifications_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          AppointmentRequest(
            appointmentRequestData: AppointmentRequestData(friendName: 'Fahad'),
          ),
          AppointmentRequest(
            appointmentRequestData: AppointmentRequestData(friendName: 'Adil'),
          ),
          AppointmentRequest(
            appointmentRequestData:
                AppointmentRequestData(friendName: 'Salman'),
          ),
        ],
      ),
    );
  }
}
