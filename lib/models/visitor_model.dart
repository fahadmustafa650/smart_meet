import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class Visitor {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final Uint8List image;
  final DateTime dateOfBirth;
  Visitor(
      {this.id,
      @required this.firstName,
      @required this.lastName,
      @required this.username,
      @required this.email,
      @required this.dateOfBirth,
      @required this.image});
}
