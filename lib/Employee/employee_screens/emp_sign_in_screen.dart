import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/screens/forget_password_screen.dart';
import 'package:smart_meet/widgets/login_with_fb.dart';
import 'package:smart_meet/widgets/login_with_google.dart';

import 'emp_sign_up_screen.dart';

class EmployeeSignInScreen extends StatefulWidget {
  static final id = '/employee_sign_in';
  final String title;
  EmployeeSignInScreen({Key key, this.title}) : super(key: key);

  @override
  _EmployeeSignInScreenState createState() => _EmployeeSignInScreenState();
}

class _EmployeeSignInScreenState extends State<EmployeeSignInScreen> {
  @override
  Widget build(BuildContext context) {
    Widget resgisterButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?'),
          SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeSignUpScreen()),
              );
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.blue[700], fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Employee Sign In',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  emailTextField(),
                  SizedBox(height: 25.0),
                  passwordField(),
                  SizedBox(height: 5.0),
                  forgetPasswordBtn(),
                  SizedBox(
                    height: 20.0,
                  ),
                  loginBtn(),
                  SizedBox(
                    height: 13.0,
                  ),
                  resgisterButton(),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LoginWithFbBtn(),
                      LoginWithGoogleBtn(),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align forgetPasswordBtn() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          //TODO: Forgot Passwoed button pressed
          Navigator.pushNamed(context, ForgetPasswordScreen.id);
        },
        child: Text(
          'Forget Password?',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }

  Widget emailTextField() {
    return Container(
      color: Colors.grey[300],
      height: 60,
      child: TextFormField(
        obscureText: false,
        style: loginTextFieldsStyles,
        decoration: InputDecoration(
          labelText: "Email",
          prefixIcon: Icon(
            Icons.email,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      color: Colors.grey[300],
      height: 60,
      child: TextFormField(
        obscureText: true,
        style: loginTextFieldsStyles,
        decoration: InputDecoration(
            border: InputBorder.none,
            // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Colors.grey,
            ),
            suffixIcon: Icon(Icons.remove_red_eye)),
      ),
    );
  }

  Container loginBtn() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.lightBlueAccent,
        ),
        height: 40.0,
        child: TextButton(
            onPressed: () {},
            child: Center(
              child: FittedBox(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )));
  }
}
