import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/Employee/employee_screens/emp_sign_up_screen.dart';
import 'package:smart_meet/Employee/employee_screens/employee_profile_screen.dart';
import 'package:smart_meet/Visitor/visitor_home_screen.dart';
import 'package:smart_meet/screens/enter_email_screen.dart';
import 'package:smart_meet/screens/new_password_screen.dart';
import 'package:smart_meet/widgets/login_with_fb.dart';
import 'package:smart_meet/widgets/login_with_google.dart';
import 'package:http/http.dart' as http;

class EmployeeSignInScreen extends StatefulWidget {
  static final id = '/employee_sign_in';
  final String title;
  EmployeeSignInScreen({Key key, this.title}) : super(key: key);

  @override
  _EmployeeSignInScreenState createState() => _EmployeeSignInScreenState();
}

class _EmployeeSignInScreenState extends State<EmployeeSignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signIn() async {
    final url = Uri.parse(
        'https://pure-woodland-42301.herokuapp.com/api/visitor/signin');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': _emailController.text,
          'password': _passwordController.text
        }),
      );
      print(response.statusCode);
      Navigator.pushNamed(context, VisitorHomeScreen.id);
    } catch (error) {
      throw error;
    }
  }

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

    final signInBtn = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.lightBlueAccent,
        ),
        height: 40.0,
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, EmployeeHomeScreen.id);
            },
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
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Card(color: Color(0XFFede8e8), child: emailTextField()),
                  SizedBox(height: 25.0),
                  Card(color: Color(0XFFede8e8), child: passwordField()),
                  SizedBox(height: 5.0),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        //TODO: Forgot Passwoed button pressed
                        Navigator.pushNamed(context, EnterEmailScreen.id);
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23.0,
                  ),
                  signInBtn,
                  SizedBox(
                    height: 13.0,
                  ),
                  resgisterButton(),
                  SizedBox(
                    height: 13.0,
                  ),
                  Text(
                    'OR Continue with',
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LoginWithFbBtn(),
                      LoginWithGoogleBtn(),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
        controller: _emailController,
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
        controller: _passwordController,
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
}
