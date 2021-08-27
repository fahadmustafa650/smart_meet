import 'package:flutter/material.dart';

import 'reserve_spot_employee_screen.dart';
import 'search_employee_screen.dart';

class EmployeeSearchResultScreen extends StatefulWidget {
  static final id = '/employee_result_screen';
  @override
  _EmployeeSearchResultScreenState createState() =>
      _EmployeeSearchResultScreenState();
}

class _EmployeeSearchResultScreenState
    extends State<EmployeeSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          EmployeeInfoContainer(
            employeeName: 'Abdullah Shahid',
            jobTitle: 'Job Name',
            imageFileName: 'profilepic.jpeg',
          ),
          EmployeeInfoContainer(
            employeeName: 'Abdullah Shahid',
            jobTitle: 'Job Name',
            imageFileName: 'profilepic.jpeg',
          ),
          EmployeeInfoContainer(
            employeeName: 'Abdullah Shahid',
            jobTitle: 'Job Name',
            imageFileName: 'profilepic.jpeg',
          ),
          EmployeeInfoContainer(
            employeeName: 'Abdullah Shahid',
            jobTitle: 'Job Name',
            imageFileName: 'profilepic.jpeg',
          ),
        ],
      ),
    );
  }
}

class EmployeeInfoContainer extends StatelessWidget {
  final String employeeName;
  final String jobTitle;
  final imageFileName;
  const EmployeeInfoContainer(
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
            EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
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
                  Text(
                    jobTitle,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ReserveEmployeeSpotScreen.id);
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
                        'Book an Appointment',
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
