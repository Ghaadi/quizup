import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './chat_bubble.dart';
import '../End Screen/end.dart';
import 'dart:async';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
    border: Border(
  top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
));

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  final String _score, _categoryName;
  final String _username;
  final int myScore;
  final int opponentScore;
  const ChatScreen(this._score, this._username, this._categoryName,
      this.myScore, this.opponentScore);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  var _controller = TextEditingController();

  String message = "";

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 20), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => EndScreen(
              widget._score.toString(),
              widget._username,
              widget._categoryName,
              widget.myScore,
              widget.opponentScore,
              false)));
    });
  }

  Future<void> addMessage() {
    return messages
        .add({
          'sender': FirebaseAuth.instance.currentUser?.email,
          'text': message
        })
        .then((value) => print("Message Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              }),
        ],
        title: Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ChatBubble(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _controller.clear();
                      addMessage();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: ChatScreen()));
}*/
