import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileiPickerBottom extends StatelessWidget {
  final Function onPressed;

  const ProfileiPickerBottom({
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onPressed,
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
                onTap: onPressed,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.camera_alt, size: 30),
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
  }
}
