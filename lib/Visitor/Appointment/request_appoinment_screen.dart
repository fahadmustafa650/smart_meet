import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'appointment_sent_screen.dart';
import 'reserve_spot_employee_screen.dart';

class RequestAppointmentScreen extends StatefulWidget {
  static final id = '/request_appoinment_screen';
  @override
  _RequestAppointmentScreenState createState() =>
      _RequestAppointmentScreenState();
}

class _RequestAppointmentScreenState extends State<RequestAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Request Appoinment',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              nameField(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectDate(context),
                    selectTime(context),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              companyNameField(),
              visitReasonField(),
              requestAppointmentBtn(context)
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector requestAppointmentBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppointmentSentScreen.id);
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              color: Colors.lightBlue, borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              'Request Appointment',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

  Container visitReasonField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextFormField(
        minLines: 5,
        maxLines: 10,
        controller: null,
        decoration: InputDecoration(
            hintText:
                'In order to better serve you please let us know your reason to visit',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
      ),
    );
  }

  Container companyNameField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: null,
        decoration: InputDecoration(
            labelText: 'Company name (Optional)',
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
      ),
    );
  }

  Widget selectTime(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.4,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Select Time',
                style: TextStyle(color: Colors.grey, fontSize: 18)),
            Icon(
              FontAwesomeIcons.clock,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget selectDate(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.4,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Select Date',
                style: TextStyle(color: Colors.grey, fontSize: 18)),
            Icon(
              Icons.calendar_today,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Container nameField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 50,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Text('Ammar Zeb',
          style: TextStyle(color: Colors.black54, fontSize: 18)),
    );
  }
}
