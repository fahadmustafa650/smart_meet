import 'package:flutter/material.dart';
import 'package:smart_meet/screens/chating_screen.dart';

class PersonImageChatTime extends StatelessWidget {
  const PersonImageChatTime({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, ChatingScreen.id);
      },
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 40,
        ),
      ),
      title: Text('Name'),
      subtitle: Text('Last Message'),
      trailing: Text(
        '4 minutes ago',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }
}

class NoRecentChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No recent chats'),
    );
  }
}
