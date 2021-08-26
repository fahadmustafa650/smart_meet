import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/providers/visitor_provider.dart';

class EditProfileScreen extends StatelessWidget {
  static final id = '/edit_profile_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10),
            // height: MediaQuery.of(context).size.height * 1,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            // ),
            child: EditProfileForm(),
          ),
        ),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(text: '');
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _phoneNoController = TextEditingController();

  File _image;
  void submitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      //TODO: Enter Backend code to submit form
    }
  }

  void _imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  void _imgFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
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

  @override
  Widget build(BuildContext context) {
    final visitorData = Provider.of<Visitors>(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => _showModalBottomSheet(context),
              child: Center(
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
                        backgroundImage: visitorData.imageList != null
                            ? MemoryImage(visitorData.imageList)
                            : AssetImage('assets/images/blank_pic.jpg'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextFormField(
              obscureText: false,
              style: loginTextFieldsStyles,
              //controller: _nameController,
              initialValue:
                  '${visitorData.getVisitor.firstName} ${visitorData.getVisitor.lastName}',
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Text";
                }
                return null;
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              obscureText: false,
              style: loginTextFieldsStyles,
              //controller: _userNameController,
              initialValue: visitorData.getVisitor.username,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Text";
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'User Name',
                hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              obscureText: false,
              style: loginTextFieldsStyles,
              initialValue: visitorData.getVisitor.email,
              //controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Email";
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Enter Email',
                hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              obscureText: false,
              style: loginTextFieldsStyles,
              //controller: _phoneNoController,
              initialValue: DateFormat.yMMMMd('en_US')
                  .format(visitorData.getVisitor.dateOfBirth),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Text";
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: '',
                hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              obscureText: false,
              style: loginTextFieldsStyles,
              //initialValue: visitorData.getVisitor.,
              //controller: _emailController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Text";
                }
                return null;
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: '+923331234567',
                hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
