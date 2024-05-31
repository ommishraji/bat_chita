import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kboxkadecoration2 = InputDecoration(
  hintText: 'Enter your email',
  hintStyle: TextStyle(
      color: Colors.grey
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kboxkadecoration1 = InputDecoration(
hintText: 'Enter your ',
hintStyle: TextStyle(
color: Colors.grey
),
contentPadding:
EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(32.0)),
),
enabledBorder: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.lightBlueAccent, width: 1.0),
borderRadius: BorderRadius.all(Radius.circular(32.0)),
),
focusedBorder: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.lightBlueAccent, width: 2.0),
borderRadius: BorderRadius.all(Radius.circular(32.0)),
),
);

class buttonwork extends StatelessWidget {
  buttonwork({required this.color, required this.text});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        //),
      ),
    );
  }
}
