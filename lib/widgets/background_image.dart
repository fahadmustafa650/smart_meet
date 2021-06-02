import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      child: Opacity(
        opacity: 0.4,
        child: Image(
          //BACKGROUND IMAGE FOR EDIT PROFILE CLASS
          image: AssetImage('assets/images/basket_ball123.png'),
        ),
      ),
    );
  }
}
