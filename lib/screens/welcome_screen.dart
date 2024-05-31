import 'package:bat_chita/screens/login_screen.dart';
import 'package:bat_chita/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
    );
    animation = ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    controller.forward();



    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: controller.value*120,
                    ),
                  ),
                ),SizedBox(
                    width: 250.0,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    child: AnimatedTextKit(
                      animatedTexts: [
              TypewriterAnimatedText('Baat Chit'),
            ],
          ),
        ),
      ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                 //Go to login screen.
              },
              child: buttonwork(
                color: Colors.lightBlueAccent,
                text: 'Log In',
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                //Go to login screen.
              },
              child: buttonwork(
                color: Colors.blueAccent,
                text: 'Register',
              )
            ),
          ],
        ),
      ),
    );
  }
}
