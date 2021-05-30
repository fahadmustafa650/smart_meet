import 'package:flutter/material.dart';
import 'package:smart_meet/models/message_model.dart';

const chatBubbleColor = Colors.blue;

class ChatingScreen extends StatefulWidget {
  static final id = '/chatting_screen';
  @override
  _ChatingScreenState createState() => _ChatingScreenState();
}

class _ChatingScreenState extends State<ChatingScreen> {
  bool isMee = true;

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "User Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.call,
                color: Colors.lightBlueAccent,
              ),
              onPressed: null)
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                //final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                // return _chatBubble(message, isMe, isSameUser);
                isMee = isMee == true ? false : true;
                return _chatBubble(message, isMee, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }

  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      //Mine Side Chat
      return myChatBubble(message);
    } else {
      //Other Side chat
      return otherSideChatBubble(message);
    }
  }

  Column myChatBubble(Message message) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: chatBubbleColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    '2 mints ago',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column otherSideChatBubble(Message message) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '2 mints ago',
                    style: TextStyle(color: Colors.grey[800], fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Send a message..',
                suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: Theme.of(context).primaryColor,
                    )),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
