import 'package:flutter/material.dart';
import 'package:smart_meet/Employee/employee_screens/emp_sign_up_screen.dart';
import 'package:smart_meet/Visitor/Visitor%20Authentication/visitor_sign_up_screen.dart';
import 'package:smart_meet/widgets/top_logo.dart';
import 'login_as_screen.dart';

class SignUpAsScreen extends StatefulWidget {
  static final id = '/sign_up_as';
  @override
  _SignUpAsScreenState createState() => _SignUpAsScreenState();
}

class _SignUpAsScreenState extends State<SignUpAsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopLogo(),
              Column(
                children: [
                  Text(
                    'SIGN UP AS',
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
                    children: [CoachCircleBtn(), AthleteCircleBtn()],
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        loginBtn(),
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
      onTap: () {
        Navigator.pushNamed(context, LoginAsScreen.id);
      },
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.blue[900], fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class AthleteCircleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //SIGN UP AS EMPLOYEE Btn
        Navigator.pushNamed(context, EmployeeSignUpScreen.id);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            //EMPLOYEE ICON
            backgroundImage: AssetImage('assets/images/athelete.webp'),
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

class CoachCircleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, VisitorSignUpScreen.id);
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            //VISITOR ICON
            backgroundImage: AssetImage('assets/images/coach.png'),
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
