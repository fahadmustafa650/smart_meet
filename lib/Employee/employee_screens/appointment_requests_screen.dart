import 'package:flutter/material.dart';
import 'package:smart_meet/models/appointment_request_model.dart';
import 'package:smart_meet/widgets/appointment_request.dart';

class AppointmentRequestsScreen extends StatefulWidget {
  static final id = 'appointment_request_screen';
  const AppointmentRequestsScreen({Key key}) : super(key: key);

  @override
  _AppointmentRequestsScreenState createState() =>
      _AppointmentRequestsScreenState();
}

class _AppointmentRequestsScreenState extends State<AppointmentRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Requests',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          AppointmentRequest(
            appointmentRequestData:
                AppointmentRequestData(id: 'c1', friendName: 'Fahad Mustafa'),
          ),
          AppointmentRequest(
            appointmentRequestData:
                AppointmentRequestData(id: 'c2', friendName: 'Fahad ul Hassan'),
          ),
          AppointmentRequest(
            appointmentRequestData:
                AppointmentRequestData(id: 'c3', friendName: 'Ammar Zeb Khan'),
          )
        ],
      ),
    );
  }
}
