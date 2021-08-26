import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetImage extends StatefulWidget {
  const GetImage({Key key}) : super(key: key);

  @override
  _GetImageState createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  final url = Uri.parse(
      'https://pure-woodland-42301.herokuapp.com/api/visitor/fahsdfssssvvssdsddddddjssssjhdgjddksssddslfjs11@gmail.com/avatar');
  var extractedData;
  var isLoading = true;
  void getData() async {
    final response = await http.get(url);
    extractedData = await json.decode(response.body);

    if (extractedData == null) {
      return;
    }
    setState(() {
      isLoading = false;
    });
    print(extractedData);
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.network(
            'https://pure-woodland-42301.herokuapp.com/api/visitor/fahsdfssssvvssdsddddddjssssjhdgjddksssddslfjs11@gmail.com/avatar'));
  }
}
