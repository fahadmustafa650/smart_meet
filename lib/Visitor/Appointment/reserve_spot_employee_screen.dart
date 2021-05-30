import 'package:flutter/material.dart';
import 'package:smart_meet/widgets/custom_employee_spot_info.dart';

class ReserveEmployeeSpotScreen extends StatelessWidget {
  static final id = '/employee_reserve_spot';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text(
          'Reserve a Spot',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profilepic.jpeg'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mr. Abdullah Shahid',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Job Name',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            CustomEmployeeSpotsInfoCard(
              date: 'Wednesday, 12 May,2021',
              availabeTime: '3:00pm-6:00pm',
              deptName: 'Dept Name',
              totalSpots: 5,
            ),
            CustomEmployeeSpotsInfoCard(
              date: 'Thursday, 13 May,2021',
              availabeTime: '2:00pm-4:00pm',
              deptName: 'Dept Name',
              totalSpots: 4,
            ),
            CustomEmployeeSpotsInfoCard(
              date: 'Friday, 14 May,2021',
              availabeTime: '1:00pm-3:00pm',
              deptName: 'Dept Name',
              totalSpots: 8,
            ),
          ]),
        ),
      ),
    );
  }
}
