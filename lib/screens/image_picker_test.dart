import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({Key key}) : super(key: key);

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File _image;
  void _imgFromGallery() async {
    // File image = await ImagePicker.pickImage(
    //     source: ImageSource.camera, imageQuality: 50);
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  void _imgFromCamera() async {
    // File image = await ImagePicker.pickImage(
    //     source: ImageSource.camera, imageQuality: 50);
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
      print('file');
      print(_image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: _image == null
                ? Image(
                    image: AssetImage('assets/images/profilepic.jpeg'),
                  )
                : Image.file(File(_image.path)),
          ),
          TextButton(
            onPressed: _imgFromCamera,
            child: Text('Get Image'),
          )
        ],
      ),
    );
  }
}
