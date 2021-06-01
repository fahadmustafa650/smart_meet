import 'package:flutter/material.dart';

import 'password_changed_successfully.dart';

class NewPasswordScreen extends StatelessWidget {
  static final id = '/new_password_screen';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter New Password',
              style: TextStyle(color: Colors.white, fontSize: 25)),
          SizedBox(
            height: 20,
          ),
          newPasswordField(screenWidth),
          SizedBox(
            height: 20,
          ),
          confirmNewPasswordField(screenWidth),
          SizedBox(
            height: 20,
          ),
          updateBtn(context, screenWidth),
        ],
      ),
    );
  }

  Card newPasswordField(double screenWidth) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Enter New Password',
            prefixIcon: Icon(Icons.lock),
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
      ),
    );
  }

  GestureDetector updateBtn(BuildContext context, double screenWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PasswordChanged.id);
      },
      child: Container(
        width: screenWidth * 0.7,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white, width: 1.5),
            color: Colors.blue[900]),
        child: Center(
          child: Text(
            'Update',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Card confirmNewPasswordField(double screenWidth) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: TextFormField(
        controller: null,
        decoration: InputDecoration(
            labelText: 'Confirm New Password',
            prefixIcon: Icon(Icons.lock),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
      ),
    );
  }
}
