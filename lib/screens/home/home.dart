import 'package:flutter/material.dart';
import 'package:chatbox/screens/Connections/connetions.dart';
import 'package:chatbox/screens/chat/chat.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  State<StatefulWidget> createState() {
    return MyHome();
  }
}

class MyHome extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meetup',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 46, 197),
          ),
        ),
        // foregroundColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 400,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  30,
                ),
              ),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Row(
              children: [
                Container(
                  // height: 20,
                  //margin: EdgeInsets.all(15),
                  child: IconButton(
                    iconSize: 20,
                    color: Color.fromARGB(255, 0, 3, 195),
                    icon: const Icon(Icons.search),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {
                      print("search1");
                    },
                  ),
                ),
                Container(
                  width: 350,
                  child: FlatButton(
                    child: Text(
                      'search.......                                                          ',
                    ),
                    onPressed: () {
                      print('search');
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // height: 20,
                    //margin: EdgeInsets.all(15),
                    child: IconButton(
                      iconSize: 30,
                      color: Color.fromARGB(255, 0, 3, 195),
                      icon: const Icon(Icons.chat_bubble_outline),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        print("chat");
                        Navigator.pushNamed(context, Chats.routeName);
                      },
                    ),
                  ),
                  Container(
                    // height: 20,
                    //margin: EdgeInsets.all(15),
                    child: IconButton(
                      iconSize: 30,
                      color: Color.fromARGB(255, 0, 3, 195),
                      icon: const Icon(Icons.people_alt_outlined),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        print("Connetions");
                        Navigator.pushNamed(context, Connections.routeName);
                      },
                    ),
                  ),
                  Container(
                    // height: 20,
                    //margin: EdgeInsets.all(15),
                    child: IconButton(
                      iconSize: 30,
                      color: Color.fromARGB(255, 0, 3, 195),
                      icon: const Icon(Icons.person),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        print("Profile");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
