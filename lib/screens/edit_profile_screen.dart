import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/widgets/custom_dropdown.dart';
import 'package:smart_meet/widgets/profile_picture.dart';

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

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _phoneNoController = TextEditingController();

  void submitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      //TODO: Enter Backend code to submit form
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            ProfilePictureWidget(),
            nameTextField(),
            SizedBox(
              height: 8,
            ),
            userNameTextField(),
            SizedBox(
              height: 8,
            ),
            emailTextField(),
            SizedBox(
              height: 8,
            ),
            dateOfBirthTextField(),
            SizedBox(
              height: 8,
            ),
            phoneNoTextField(),
            SizedBox(
              height: 8,
            ),
            updateBtn(context),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  GestureDetector updateBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          'Update',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }

  Widget phoneNoTextField() {
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
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: '+923331234567',
        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
        border: InputBorder.none,
      ),
    );
  }

  Widget dateOfBirthTextField() {
    return TextFormField(
      obscureText: false,
      style: loginTextFieldsStyles,
      controller: _phoneNoController,
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
        hintText: '12 June,1999',
        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
        border: InputBorder.none,
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      obscureText: false,
      style: loginTextFieldsStyles,
      controller: _nameController,
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
        hintText: 'Fahadmustafa123@gmail.com',
        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
        border: InputBorder.none,
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      obscureText: false,
      style: loginTextFieldsStyles,
      controller: _nameController,
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
    );
  }

  Widget userNameTextField() {
    return TextFormField(
      obscureText: false,
      style: loginTextFieldsStyles,
      controller: _userNameController,
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
    );
  }
}
