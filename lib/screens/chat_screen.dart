import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
final _store = FirebaseFirestore.instance;
dynamic loggedin;
class ChatScreen extends StatefulWidget {
  static String id = 'chatscreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  late String message;

  final controller = TextEditingController();

  void getUserId() async {
    try{
      final user = await _auth.currentUser;
      if(user != null){
        loggedin = user.email;
      }
    } catch(e){
      print(e);
    }
  }


  @override
  void initState() {
    super.initState();
    getUserId();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            steam(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Implement send functionality.
                      controller.clear();
                      _store.collection('messages').add({
                        'text': message,
                        'sender': loggedin
                      });
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

class messagedeco extends StatelessWidget {
  messagedeco({required this.sender, required this.message, required this.isME});
  String sender;
  String message;
  bool isME;
  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isME? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Material(
            elevation: 5,
              borderRadius: isME? BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ): BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: isME ? Colors.blueAccent: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message,
                style: TextStyle(
                    fontSize: 15,
                  color: isME? Colors.white: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class steam extends StatelessWidget {
  const steam({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>
      (
        stream: _store.collection('messages').snapshots(),
        builder: (context, snapsort){
          if(snapsort.hasData){
            final messages = snapsort.data!.docs.reversed;
            List<messagedeco> messagewidgit = [];
            for(var message in messages){
              final messagetext = message['text'];
              final messagesender = message['sender'];
              messagewidgit.add(
                  messagedeco(
                      sender: messagesender,
                      message: messagetext,
                      isME: loggedin == messagesender,
                  ));
            }
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  reverse: true,
                  children: messagewidgit,
                ),
              ),
            );
          }
          else {
            return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                ));
          }
        }
    );
  }
}

