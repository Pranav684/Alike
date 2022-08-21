import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:chatbox/screens/login/login.dart';
import 'package:chatbox/screens/auth/auth_screen.dart';
import 'package:chatbox/screens/regi/register.dart';

class Alog extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(15),
          height: 70,
          //constraints: BoxConstraints.expand(),
          width: 280,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Register.routeName);
            },
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 27,
                color: Color.fromARGB(255, 0, 57, 104),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.all(10),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
                side: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
        ),
        Container(
          height: 70,
          width: 280,
          margin: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Login.routeName);
            },
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 27,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
        ),
        Container(
          height: 200,
        )
      ],
    );
  }
}
