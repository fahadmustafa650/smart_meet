import 'package:flutter/material.dart';
import 'package:smart_meet/Visitor/Visitor%20Verification%20Steps/booked_appointment_qrcode.dart';

import 'reserve_spot_employee_screen.dart';
import 'search_employee_screen.dart';

class BookedAppointmentsScreen extends StatefulWidget {
  static final id = '/booked_appointment_result';
  @override
  _BookedAppointmentsScreenState createState() =>
      _BookedAppointmentsScreenState();
}

class _BookedAppointmentsScreenState extends State<BookedAppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Appointments'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          EmployeeBookedInfoContainer(
            employeeName: 'Abdullah Shahid',
            jobTitle: 'Job Name',
            imageFileName: 'profilepic.jpeg',
          ),
          EmployeeBookedInfoContainer(
            employeeName: 'Abdullah Shahid',
            jobTitle: 'Job Name',
            imageFileName: 'profilepic.jpeg',
          ),
          EmployeeBookedInfoContainer(
            employeeName: 'Abdullah Shahid',
            jobTitle: 'Job Name',
            imageFileName: 'profilepic.jpeg',
          ),
          EmployeeBookedInfoContainer(
            employeeName: 'Abdullah Shahid',
            jobTitle: 'Job Name',
            imageFileName: 'profilepic.jpeg',
          ),
        ],
      ),
    );
  }
}

class EmployeeBookedInfoContainer extends StatelessWidget {
  final String employeeName;
  final String jobTitle;
  final imageFileName;
  const EmployeeBookedInfoContainer(
      {Key key,
      @required this.employeeName,
      @required this.jobTitle,
      @required this.imageFileName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        width: screenWidth * 0.9,
        margin:
            EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 10),
        height: 150,
        child: Card(
          elevation: 3,
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/$imageFileName'),
              ),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    employeeName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '14 May 2021',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '14:30-15:30',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, BookedAppointmentQRCode.id);
                    },
                    child: Container(
                      width: screenWidth * 0.45,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Center(
                          child: Text(
                        'GET QR CODE',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
