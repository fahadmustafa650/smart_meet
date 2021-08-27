import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_meet/models/visitor_model.dart';
import 'package:http/http.dart' as http;

class Visitors with ChangeNotifier {
  List<int> imageList;
  Visitor _visitor;

  Visitor get getVisitor {
    return _visitor == null ? Visitor() : _visitor;
  }

  Future<void> getVisitorData(String email) async {
    final url = Uri.parse(
        'https://pure-woodland-42301.herokuapp.com/api/visitor/$email/viewProfile');
    final response = await http.get(url);
    final visitorData = jsonDecode(response.body);
    // final List<int> imageData =
    //     await (visitorData['user']['avatar']['data']).cast<int>();
    // Uint8List imageList = Uint8List.fromList(imageData);
    // this.imageList = imageList;
    _visitor = Visitor(
      id: visitorData['user']['id'].toString(),
      firstName: visitorData['user']['firstName'].toString(),
      lastName: visitorData['user']['lastName'].toString(),
      username: visitorData['user']['username'].toString(),
      email: email,
      dateOfBirth: DateTime.tryParse(visitorData['user']['dateOfBirth']),
      imageUrl: visitorData['user']['avatar'].toString(),
    );
    notifyListeners();
  }
}
