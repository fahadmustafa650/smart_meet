import 'dart:io' as io;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/Visitor/Visitor%20Authentication/visitor_sign_in_screen.dart';

import 'package:smart_meet/screens/otp_screen.dart';
import 'package:smart_meet/widgets/login_with_fb.dart';
import 'package:smart_meet/widgets/login_with_google.dart';
import 'package:http/http.dart' as http;
import 'package:smart_meet/widgets/term_condition.dart';
import 'package:string_validator/string_validator.dart';

class VisitorSignUpScreen extends StatefulWidget {
  static final id = '/visitor_sign_up';
  @override
  _VisitorSignUpScreenState createState() => _VisitorSignUpScreenState();
}

class _VisitorSignUpScreenState extends State<VisitorSignUpScreen> {
  //VARIABLES
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userNameController = TextEditingController();
  DateTime _dateOfBirth;
  var isChecked = false;
  // formKey
  final _formKey = GlobalKey<FormState>();
  // File imgFile;
  io.File _image;

  Future<http.StreamedResponse> _addVisitorData() async {
    // var multipartFile = http.MultipartFile.fromBytes(, value);
    Uint8List data = _image.readAsBytesSync();
    List<int> imageData = data.cast();
    print(imageData);
    var multipartFile =
        http.MultipartFile.fromBytes('avatar', imageData, filename: 'myFile.png'
            // use the real name if available, or omit
            //contentType: MediaType('image' 'jpeg'),
            );
    final url = Uri.parse(
        "https://pure-woodland-42301.herokuapp.com/api/visitor/Visitorsignup");
    var request = http.MultipartRequest('POST', url);
    request.files.add(multipartFile);
    print(multipartFile);
    request.headers.addAll({
      'Content-Type': 'Multipart/form-data',
    });
    print(_firstNameController.text);
    print(_emailController.text);
    print(_userNameController.text);
    request.fields['firstName'] = _firstNameController.text.toString();
    request.fields['lastName'] = _lastNameController.text.toString();
    request.fields['email'] = _emailController.text.toString();
    request.fields['username'] = _userNameController.text.toString();
    request.fields['password'] = _passwordController.text.toString();
    request.fields['dateOfBirth'] = _dateOfBirth.toIso8601String();

    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Fluttertoast.showToast(
        msg: "Sign Up Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushNamed(context, VisitorSignInScreen.id);
    }
    return response;
  }

  Future<int> _isEmailExist(String value) async {
    final url = Uri.parse(
        'https://pure-woodland-42301.herokuapp.com/api/visitor/verifyemail/$value');
    final response = await http.get(url);
    return response.statusCode;
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.white,
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile Photo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.photo, size: 30),
                          Text(
                            'Gallery',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _imgFromCamera();
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  String dateErrorMessage = '';
  // Submit Data
  void _submitForm() async {
    final isValid = _formKey.currentState.validate();
    if (_dateOfBirth == null) {
      setState(() {
        dateErrorMessage = 'Date Not Selected';
      });
    }
    if (_image == null) {
      setState(() {
        profilePicError = 'Add Profile Picture';
      });
    }
    if (!isValid || !isChecked || _image == null) {
      return;
    }
    _formKey.currentState.save();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(
          email: _emailController.text.toString(),
          addAllData: _addVisitorData,
        ),
      ),
    );
  }

  void _imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = io.File(image.path);
    });
  }

  void _imgFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = io.File(image.path);
      profilePicError = '';
    });
  }

  var errorPassword = '';
  var profilePicError = '';
  bool _isDateSelected = false;
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
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  _showModalBottomSheet(context);
                                },
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
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 128,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: _image != null
                                            ? FileImage(_image)
                                            : AssetImage(
                                                'assets/images/blank_pic.jpg'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              _image == null ? profilePicError : '',
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: TextFormField(
                                      controller: _firstNameController,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter a name';
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'First Name',
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        border: InputBorder.none,
                                        fillColor: Colors.grey[100],
                                        filled: true,
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.userAlt,
                                          color: Colors.grey,
                                          size: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: TextFormField(
                                      controller: _firstNameController,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter a name';
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Last Name',
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        border: InputBorder.none,
                                        fillColor: Colors.grey[100],
                                        filled: true,
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.userAlt,
                                          color: Colors.grey,
                                          size: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: TextFormField(
                                controller: _userNameController,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter a value';
                                  } else if (!isAlphanumeric(value)) {
                                    return 'Username must contain both alpha & numeric characters';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'User Name',
                                  labelStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  border: InputBorder.none,
                                  fillColor: Colors.grey[100],
                                  filled: true,
                                  prefixIcon: const Icon(
                                    FontAwesomeIcons.userAlt,
                                    color: Colors.grey,
                                    size: 15.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: TextFormField(
                                obscureText: false,
                                style: loginTextFieldsStyles,
                                textInputAction: TextInputAction.next,
                                controller: _emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Email";
                                  } else if (!value.contains('@') ||
                                      !value.contains('.com')) {
                                    return 'Please Enter valid Email';
                                  } else if (_isEmailExist(value) == 200) {
                                    return 'Already Register with this account';
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
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: ListTile(
                                onTap: () async {
                                  await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1870),
                                          lastDate: DateTime.now())
                                      .then((date) {
                                    setState(() {
                                      _dateOfBirth = date;
                                      _isDateSelected = true;
                                      // print('date=$_dateOfBirth');
                                    });
                                  });
                                },
                                tileColor: Colors.grey[100],
                                leading: Text(
                                  _dateOfBirth == null
                                      ? 'Tap To Enter DOB'
                                      : _dateOfBirth.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: Icon(FontAwesomeIcons.calendarAlt),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  !_isDateSelected ? '' : dateErrorMessage,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: TextFormField(
                                controller: _phoneNumberController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Phone No";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[100],
                                  filled: true,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(
                                    20.0,
                                    15.0,
                                    20.0,
                                    15.0,
                                  ),
                                  labelText: 'Phone No',
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: TextFormField(
                                obscureText: true,
                                style: loginTextFieldsStyles,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Password";
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[100],
                                    filled: true,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.fromLTRB(
                                      20.0,
                                      15.0,
                                      20.0,
                                      15.0,
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: Icon(Icons.remove_red_eye)),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: TextFormField(
                                obscureText: true,
                                style: loginTextFieldsStyles,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                controller: _confirmPasswordController,
                                onChanged: (value) {
                                  if (value !=
                                      _passwordController.text.toString()) {
                                    setState(() {
                                      errorPassword = "Password Doesn't Match";
                                    });
                                  }
                                  if (value ==
                                      _passwordController.text.toString()) {
                                    setState(() {
                                      errorPassword = "";
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Password";
                                  } else if (value !=
                                      _passwordController.text.toString()) {
                                    return "Those passwords didn’t match. Try again.";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[100],
                                  filled: true,
                                  //errorText: errorPassword,
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 14),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(
                                    20.0,
                                    15.0,
                                    20.0,
                                    15.0,
                                  ),
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            ListTile(
                              leading: TermsCondition(),
                              trailing: Checkbox(
                                value: isChecked,
                                onChanged: (bool value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                },
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

  Container signUpBtn() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.lightBlueAccent,
        ),
        height: 40.0,
        child: TextButton(
            onPressed: _submitForm,
            child: Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )));
  }
}

class AlreadyAccount extends StatelessWidget {
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
