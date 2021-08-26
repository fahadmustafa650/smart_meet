import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class Visitor {
  final String id;
  final String name;
  final String username;
  final String email;
  final Uint8List image;
  final DateTime dateOfBirth;
  Visitor(
      {this.id,
      @required this.name,
      @required this.username,
      @required this.email,
      @required this.dateOfBirth,
      @required this.image});
}
