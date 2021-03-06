import 'package:flutter/material.dart';
import 'package:smart_meet/widgets/person_image_time.dart';

class ChatScreen extends StatelessWidget {
  static final id = '/chat_screen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          PersonImageChatTime(),
          Divider(
            thickness: 2,
          ),
          PersonImageChatTime(),
          Divider(
            thickness: 2,
          ),
          PersonImageChatTime(),
          Divider(
            thickness: 2,
          ),
          PersonImageChatTime()
        ],
      ),
    );
  }
}
