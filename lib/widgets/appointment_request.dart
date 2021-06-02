import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:smart_meet/models/appointment_request_model.dart';

class AppointmentRequest extends StatelessWidget {
  final AppointmentRequestData appointmentRequestData;

  const AppointmentRequest({this.appointmentRequestData});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),

      height: 150,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(children: [
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profilepic.jpeg'),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Fahad Mustafa',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconTextWidget(
                  iconData: Icons.calendar_today,
                  text: '25 May,2021',
                ),
                CustomIconTextWidget(
                  iconData: Icons.timer,
                  text: '10:30 am',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [acceptButton(), rejectButton()],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget acceptButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 35,
        width: 160,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            'Accept',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget rejectButton() {
    return GestureDetector(
      child: Container(
        height: 36,
        width: 160,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: const Text(
            'Reject',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.4),
        textColor: Colors.white,
        fontSize: 13.0);
  }
}

class CustomIconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  const CustomIconTextWidget({
    Key key,
    @required this.iconData,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
