import 'package:flutter/material.dart';
import 'package:smart_meet/Employee/employee_screens/emp_sign_in_screen.dart';
import 'package:smart_meet/Visitor/Visitor Authentication/visitor_sign_in_screen.dart';
import 'package:smart_meet/screens/sign_up_as_screen.dart';
import 'package:smart_meet/widgets/top_logo.dart';

class LoginAsScreen extends StatefulWidget {
  static final id = '/login_as';
  @override
  _LoginAsScreenState createState() => _LoginAsScreenState();
}

class _LoginAsScreenState extends State<LoginAsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Container(
          width: screenWidth * 1,
          height: screenHeight * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopLogo(),
              Column(
                children: [
                  Text(
                    'Login As',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //BOTH CIRCULAR SHAPES COACH AND ATHLETE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [VisitorCircleBtn(), EmployeeCircleBtn()],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not Registered?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        registerBtn(context),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginBtn() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.blue[900], fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

Widget registerBtn(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, SignUpAsScreen.id);
    },
    child: Text(
      'Register',
      style: TextStyle(
          color: Colors.blue[900], fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

class EmployeeCircleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //SIGN UP AS EMPLOYEE Btn
        Navigator.pushNamed(context, EmployeeSignInScreen.id);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            //EMPLOYEE ICON
            backgroundImage: AssetImage('assets/images/employee_icon.png'),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Employee',
            style: TextStyle(
                color: Colors.blue[900],
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class VisitorCircleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, VisitorSignInScreen.id);
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            //VISITOR ICON
            backgroundImage: AssetImage('assets/images/visitor_icon.jpg'),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Visitor',
          style: TextStyle(
              color: Colors.blue[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
