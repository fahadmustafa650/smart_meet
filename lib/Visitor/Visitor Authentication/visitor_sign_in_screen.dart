import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/Visitor/visitor_home_screen.dart';
import 'package:smart_meet/providers/visitor_provider.dart';
import 'package:smart_meet/screens/enter_email_screen.dart';
import 'package:smart_meet/widgets/login_with_fb.dart';
import 'package:smart_meet/widgets/login_with_google.dart';
import 'visitor_sign_up_screen.dart';
import 'package:http/http.dart' as http;

class VisitorSignInScreen extends StatefulWidget {
  static final id = '/visitor_sign_in';
  VisitorSignInScreen({Key key}) : super(key: key);
  @override
  _VisitorSignInScreenState createState() => _VisitorSignInScreenState();
}

class _VisitorSignInScreenState extends State<VisitorSignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  void signIn() async {
    final url = Uri.parse(
        'https://pure-woodland-42301.herokuapp.com/api/visitor/signin');

    try {
      setState(() {
        _isLoading = true;
      });
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setVisitingFlag();
        setState(() {
          _isLoading = false;
        });
        print('statusCode=${response.statusCode}');
        Navigator.pushNamed(context, VisitorHomeScreen.id,
            arguments: {'email': _emailController.text.toString()});
      }
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
            onPressed: () async {
              signIn();
              // Navigator.pushNamed(context, VisitorHomeScreen.id);
            },
            child: Center(
              child: FittedBox(
                child: !_isLoading
                    ? Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : CircularProgressIndicator(
                        backgroundColor: Colors.white,
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

  void setVisitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('alreadyVisited', true);
    print(preferences);
  }

  Future<bool> getVisitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool alreadyVisited = preferences.getBool('alreadyVisited') ?? false;
    return alreadyVisited;
  }
}
