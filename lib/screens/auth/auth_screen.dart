import 'package:flutter/material.dart';
import 'package:chatbox/screens/auth/auth_log.dart';
import 'package:chatbox/screens/login/login.dart';

class Auth extends StatelessWidget {
  static String routeName = '/auth';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.fromLTRB(30, 100, 10, 0),
            child: Text(
              'Meet Peaople',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 15, 148),
                fontSize: 25,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
            child: Text(
              'With Same Interest',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 15, 148),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                child: Alog(),
                height: 759,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 110, 243, 255),
                      Color.fromARGB(255, 79, 18, 177)
                    ],
                  ),
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/images/sign1.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
