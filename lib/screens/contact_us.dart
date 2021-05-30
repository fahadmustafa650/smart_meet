import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double textFieldIconSize = 30;

class ContactUs extends StatelessWidget {
  static final id = '/contact_us';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            //TODO: Back icon Button in ContactUs Screen
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4.0,
                  shape: CircleBorder(),
                  child: IconButton(
                    onPressed: () {
                      //TODO:
                    },
                    icon: Icon(
                      Icons.phone,
                      color: Colors.orange,
                    ),
                  ),
                ),
                SizedBox(width: 25.0),
                Card(
                  elevation: 4.0,
                  shape: CircleBorder(),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
              indent: 5.0,
              endIndent: 18.0,
            ),
            SizedBox(height: 15),
            Text(
              ' getTranslated(context, "have_a_question")',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                color: Colors.grey[100],
                elevation: 5.0,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'getTranslated(context, "name")',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      FontAwesomeIcons.userAlt,
                      color: Colors.orange,
                      size: textFieldIconSize,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                color: Colors.grey[100],
                elevation: 5.0,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: ' getTranslated(context, "phone")',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      FontAwesomeIcons.phone,
                      color: Colors.orange,
                      size: textFieldIconSize,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                color: Colors.grey[100],
                elevation: 5.0,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'getTranslated(context, "email")',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.orange,
                      size: textFieldIconSize,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                child: TextField(
                  minLines: 4,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'getTranslated(context, "message")',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width / 1.25,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  ' getTranslated(context, "send")',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
