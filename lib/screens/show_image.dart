import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smart_meet/providers/visitor_provider.dart';

class ShowImage extends StatefulWidget {
  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
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

  Future<void> signIn() async {
    final url = Uri.parse(
        'https://pure-woodland-42301.herokuapp.com/api/visitor/signin');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{'email': 'fahf@gmail.com', 'password': 'fahad12345'},
      ),
    );
    print('singIn=${response.statusCode}');
  }

  Future<http.StreamedResponse> uploadImageFile() async {
    print(_image);
    Uint8List data = _image.readAsBytesSync();
    List<int> imageData = data.cast();

    var multipartFile =
        http.MultipartFile.fromBytes('avatar', imageData, filename: 'myFile.png'
            // use the real name if available, or omit
            //contentType: MediaType('image' 'jpeg'),
            );
    print(multipartFile);
    // https://pure-woodland-42301.herokuapp.com/api/visitor/signup
    final url = Uri.parse(
        "https://pure-woodland-42301.herokuapp.com/api/visitor/Visitorsignup");
    var request = http.MultipartRequest('POST', url);
    try {
      request.headers.addAll({
        'Content-Type': 'Multipart/form-data',
      });
      request.files.add(multipartFile);
      var name = 'hamid';
      request.fields['name'] = name;
      request.fields['email'] = '${name}1234@gmail.com';
      request.fields['username'] = '${name}12345';
      request.fields['password'] = '${name}123456';
      request.fields['dateOfBirth'] = '1969-12-31T20:00:00.000Z';

      // print('done');
      var response = await request.send();
      print(response.statusCode);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File uploaed: ${response.statusCode}'),
        ),
      );
      return response;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    //var visitor = Provider.of<Visitors>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Provider.of<Visitors>(context, listen: false)
                      .getVisitorData('fahadmustafa650@gmail.com');
                },
                child: Text('Camera/Gallery')),
            TextButton(
              onPressed: uploadImageFile,
              child: Text('Upload image'),
            ),
          ],
        ),
      ),
    );
  }
}
