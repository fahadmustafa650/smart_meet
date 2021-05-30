import 'package:flutter/material.dart';
import 'package:smart_meet/Visitor/Appointment/request_appoinment_screen.dart';

class CustomEmployeeSpotsInfoCard extends StatelessWidget {
  final String date;
  final String availabeTime;
  final int totalSpots;
  final String deptName;
  const CustomEmployeeSpotsInfoCard({
    Key key,
    @required this.date,
    @required this.availabeTime,
    @required this.totalSpots,
    @required this.deptName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              availabeTime,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              deptName,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '$totalSpots available spots',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            reserveSpotBtn(context)
          ],
        ),
      ),
    );
  }

  GestureDetector reserveSpotBtn(BuildContext ctx) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(ctx, RequestAppointmentScreen.id);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Colors.blue),
        child: Center(
          child: Text(
            'Reserve a spot',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
