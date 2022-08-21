import 'package:flutter/material.dart';
import 'package:chatbox/screens/Connections/connetions.dart';
import 'package:chatbox/screens/home/home.dart';

class Chats extends StatefulWidget {
  static String routeName = "/chat";
  State<StatefulWidget> createState() {
    return MyChats();
  }
}

class MyChats extends State<Chats> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          color: Color.fromARGB(255, 0, 46, 197),
          onPressed: () {
            Navigator.pushNamed(context, Home.routeName);
          },
        ),
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
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          Flexible(
            child: ListView(
              itemExtent: 100,
              padding: EdgeInsets.all(10),
              children: [
                for (var i = 0; i < 15; i++) Sc(),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Align(
              // heightFactor: 70,
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: IconButton(
                        iconSize: 30,
                        color: Color.fromARGB(255, 0, 3, 195),
                        icon: const Icon(Icons.chat_bubble_outline),
                        tooltip: 'Increase volume by 10',
                        onPressed: () {
                          print("chat");
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
            ),
          ),
        ],
      ),
    );
  }

  Stack Sc() {
    return Stack(
      children: [
        Container(
          width: 450,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: Colors.black,
            ),
          ),
        ),
        Container(
          //color: Color.fromARGB(255, 233, 159, 247),
          height: 90,
          width: 450,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                //height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Image(
                  image: AssetImage('assets/images/regi.png'),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
            border: Border.all(
              color: Colors.black,
            ),
          ),
        ),
        Container(
          // height: 70,
          alignment: AlignmentDirectional.centerStart,
          child: FlatButton(
            height: 90,
            minWidth: 450,
            child: Text('Name'),
            onPressed: () => print("chat"),
          ),
        ),
      ],
    );
  }
}
