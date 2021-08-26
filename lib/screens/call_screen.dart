import 'package:flutter/material.dart';

class PhoneCallScreen extends StatelessWidget {
  static final id = '/phone_call_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //color: Colors.red,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.blue, Colors.blue],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profilepic.jpeg'),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Calling...',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                'Username',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.phone,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.volume_up, color: Colors.black, size: 40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
