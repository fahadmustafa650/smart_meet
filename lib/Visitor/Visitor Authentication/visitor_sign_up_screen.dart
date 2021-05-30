import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/widgets/login_with_fb.dart';
import 'package:smart_meet/widgets/login_with_google.dart';

import 'visitor_sign_in_screen.dart';

class VisitorSignUpScreen extends StatefulWidget {
  static final id = '/visitor_sign_up';
  @override
  _VisitorSignUpScreenState createState() => _VisitorSignUpScreenState();
}

class _VisitorSignUpScreenState extends State<VisitorSignUpScreen> {
  ///VARIABLES
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userNameController = TextEditingController();
  DateTime _dateTimeSelected;
  //
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Visitor Sign Up',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.8,
            child: Stack(
              children: [
                BackgroundUpperContainer(),
                Positioned(
                  left: 10.0,
                  top: 60.0,
                  right: 10.0,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400],
                          spreadRadius: 1.0,
                          blurRadius: 3.0,
                          // offset: offset,
                        )
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            CircularProfilePicture(),
                            SizedBox(height: 10.0),
                            nameTextField(),
                            SizedBox(
                              height: 8.0,
                            ),
                            userNameTextField(),
                            SizedBox(
                              height: 8.0,
                            ),
                            emailTextField(),
                            SizedBox(
                              height: 8.0,
                            ),
                            dateOfBirthField(),
                            SizedBox(height: 8.0),
                            phoneNoTextField(),
                            SizedBox(height: 8.0),
                            passwordTextField(),
                            SizedBox(height: 5.0),
                            confirmPasswordField(),
                            SizedBox(height: 5.0),
                            ListTile(
                              leading: conditionsAndTermsAgreement(),
                              trailing: Checkbox(
                                value: false,
                                onChanged: (bool value) {},
                              ),
                            ),
                            SizedBox(
                              height: 23.0,
                            ),
                            signUpBtn(),
                            SizedBox(
                              height: 13.0,
                            ),
                            AlreadyAccount(),
                            SizedBox(
                              height: 13.0,
                            ),
                            Text(
                              'OR Continue with',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
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
                            SizedBox(
                              height: 13.0,
                            ),
                            Text(
                              'OR Sign Up with',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 13.0,
                            ),
                            Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.2,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5, color: Colors.black)),
                              child: Image(
                                image: AssetImage('assets/images/ocr_logo.png'),
                              ),
                            ),
                            SizedBox(
                              height: 13.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile dateOfBirthField() {
    return ListTile(
      onTap: () async {
        print("object");
        await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1870),
                lastDate: DateTime.now())
            .then((date) {
          setState(() {
            _dateTimeSelected = date;
            print('date=$_dateTimeSelected');
          });
        });
      },
      tileColor: Colors.grey[100],
      leading: Text(
        _dateTimeSelected == null
            ? 'Tap To Enter DOB'
            : _dateTimeSelected.toString(),
        style: TextStyle(color: Colors.grey, fontSize: 15),
      ),
      trailing: Icon(FontAwesomeIcons.calendarAlt),
    );
  }

  TextFormField nameTextField() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
          labelText: 'Name',
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
          border: InputBorder.none,
          fillColor: Colors.grey[100],
          filled: true,
          prefixIcon: Icon(
            FontAwesomeIcons.userAlt,
            color: Colors.grey,
            size: 15.0,
          )),
    );
  }

  TextFormField userNameTextField() {
    return TextFormField(
      controller: _userNameController,
      decoration: InputDecoration(
          labelText: 'User Name',
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
          border: InputBorder.none,
          fillColor: Colors.grey[100],
          filled: true,
          prefixIcon: Icon(
            FontAwesomeIcons.userAlt,
            color: Colors.grey,
            size: 15.0,
          )),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      obscureText: true,
      style: loginTextFieldsStyles,
      keyboardType: TextInputType.visiblePassword,
      controller: _passwordController,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.grey,
          ),
          suffixIcon: Icon(Icons.remove_red_eye)),
    );
  }

  Container signUpBtn() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.lightBlueAccent,
        ),
        height: 40.0,
        child: TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )));
  }

  TextFormField phoneNoTextField() {
    return TextFormField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        filled: true,
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
        border: InputBorder.none,
        prefixIcon: Icon(
          FontAwesomeIcons.phone,
          color: Colors.grey,
          size: 15.0,
        ),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      obscureText: false,
      style: loginTextFieldsStyles,
      controller: _emailController,
      validator: (value) {
        if (value.isEmpty) {
          return "Please Enter Text";
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        filled: true,
        prefixIcon: Icon(
          Icons.email,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
        border: InputBorder.none,
      ),
    );
  }

  TextFormField confirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      style: loginTextFieldsStyles,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'Confirm Password',
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.grey,
          ),
          suffixIcon: Icon(Icons.remove_red_eye)),
    );
  }

  Container conditionsAndTermsAgreement() {
    return Container(
      width: 250,
      child: Text(
        'By Creating An Account I agree to certain terms and conditions',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class AlreadyAccount extends StatelessWidget {
  const AlreadyAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already Have an Account? ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VisitorSignInScreen()),
            );
          },
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class BackgroundUpperContainer extends StatelessWidget {
  const BackgroundUpperContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      color: Colors.lightBlueAccent,
      child: Align(
        alignment: Alignment.topCenter,
        child: Image(
          width: 200,
          color: Colors.white,
          image: AssetImage(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}

class CircularProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 128,
        height: 128,
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.camera_alt,
                    size: 25,
                  ),
                )),
            CircleAvatar(
              radius: 128,
              backgroundImage: AssetImage('assets/images/profilepic.jpeg'),
            ),
          ],
        ),
      ),
    );
  }
}
