import 'package:bat_chita/screens/chat_screen.dart';
import 'package:bat_chita/screens/login_screen.dart';
import 'package:bat_chita/screens/registration_screen.dart';
import 'package:bat_chita/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyCLYwFO6n-SlZzCLwuKbmQ6DNMIglW4gKo',
        appId: '1:299112713785:android:dbf1a343a2173ab1d747e8',
        messagingSenderId: '299112713785',
        projectId: 'bat-chita'
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          //bodyText1: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}



