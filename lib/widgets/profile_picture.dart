import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
              backgroundImage: AssetImage('assets/images/profilepic.jpeg'),
            ),
          ],
        ),
      ),
    );
  }
}
