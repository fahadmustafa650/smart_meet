import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/widgets/login_with_fb.dart';
import 'package:smart_meet/widgets/login_with_google.dart';

import 'visitor_sign_up_screen.dart';

class VisitorSignInScreen extends StatefulWidget {
  static final id = '/visitor_sign_in';
  final String title;
  VisitorSignInScreen({Key key, this.title}) : super(key: key);

  @override
  _VisitorSignInScreenState createState() => _VisitorSignInScreenState();
}

class _VisitorSignInScreenState extends State<VisitorSignInScreen> {
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
                MaterialPageRoute(builder: (context) => VisitorSignUpScreen()),
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

    final loginButon = Container(
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

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Visitor Sign In',
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
                  loginButon,
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
}
