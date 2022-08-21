import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:chatbox/screens/regi/register.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";
  @override
  State<StatefulWidget> createState() {
    return Login_State();
  }
}

class Login_State extends State<Login> {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(''), // You can add title here
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios,
              color: Color.fromARGB(255, 15, 39, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromARGB(255, 1, 6, 255)
            .withOpacity(0.3), //You can make this transparent
        elevation: 0.0, //No shadow
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 50),
              ),
              Container(
                height: 300,
                child: Image(
                  image: AssetImage(
                    'assets/images/log.png',
                  ),
                ),
              ),
              Container(
                width: 200,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      // border: InputBorder.,
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'),
                ),
              ),
              Container(
                width: 200,
                child: TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      // border: InputBorder.,
                      labelText: 'Password',
                      hintText: 'Enter Your Password'),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () => print('Forgot pass!'),
                  child: Text('Forgot Password ?'),
                  textColor: Colors.red,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 70,
                //constraints: BoxConstraints.expand(),
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    print('Logged!');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 27,
                      color: Color.fromARGB(255, 0, 57, 104),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(10),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Don\'t have any account ?'),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Register.routeName);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      textColor: Color.fromARGB(255, 107, 0, 126),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
