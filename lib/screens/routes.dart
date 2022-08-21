import 'package:chatbox/screens/Connections/connetions.dart';
import 'package:chatbox/screens/home/home.dart';
import 'package:chatbox/screens/interests/interest.dart';
import 'package:chatbox/screens/regi/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chatbox/screens/login/login.dart';
import 'chat/chat.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => Login(),
  Register.routeName: (context) => Register(),
  Interest.routeName: (context) => Interest(),
  Home.routeName: (context) => Home(),
  Connections.routeName: (context) => Connections(),
  Chats.routeName: (context) => Chats(),
};
