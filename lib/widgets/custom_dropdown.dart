import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({Key key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = "Male";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      isExpanded: true,
      hint: Text('Gender'),
      underline: Container(
        color: Colors.black,
        height: 1.0,
      ),
      style: TextStyle(color: Colors.black),
      focusColor: Colors.green,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Male', 'Female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
