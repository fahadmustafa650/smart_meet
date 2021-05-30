import 'package:flutter/material.dart';

class LoginWithGoogleBtn extends StatelessWidget {
  const LoginWithGoogleBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xfffffffb),
            border: Border.all(color: Colors.black, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 20,
              height: 20,
              image: AssetImage('assets/images/google_icon.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Google',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
