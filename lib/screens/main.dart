// @dart=2.9
import 'package:chatbox/screens/Connections/connetions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatbox/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chatbox/screens/auth/auth_screen.dart';
import 'package:chatbox/screens/login/login.dart';
import 'package:flutter/src/widgets/binding.dart';
import 'package:chatbox/screens/routes.dart';
import 'interests/interest.dart';
import 'home/home.dart';
//import 'chat/chat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      title: 'Alike',
      theme: ThemeData(
        backgroundColor: Colors.white30,
      ),
      home: Auth(),
    );
  }
}
