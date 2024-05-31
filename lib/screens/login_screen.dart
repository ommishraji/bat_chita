import 'package:bat_chita/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool spin = false;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kboxkadecoration1.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                  obscureText: true,
                  textAlign: TextAlign.center,
                decoration: kboxkadecoration1.copyWith(hintText: 'Enter your password')
              ),
              SizedBox(
                height: 24.0,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    spin = true;
                  });
                  try{
                    final userdata = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                    if(userdata != null) {
                      setState(() {
                        spin = false;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                    }
                  }
                  catch(e){
                    print(e);
                  }
                  //Go to login screen.
                },
                child: buttonwork(
                  color: Colors.lightBlueAccent,
                  text: 'Log In',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
