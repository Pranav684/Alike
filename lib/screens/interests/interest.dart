import 'package:chatbox/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'elements.dart';
import 'package:chatbox/screens/regi/register.dart';

class Interest extends StatefulWidget {
  static String routeName = "/interests";
  State<StatefulWidget> createState() {
    return MyInterest();
  }
}

class MyInterest extends State<Interest> {
  static var myList = <String>{};
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Register"),
      onPressed: () {
        Regi_State.Int = myList;
        Regi_State.submit();
        Navigator.pushNamed(context, Home.routeName);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Are you sure you want to register with the given data ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/0001.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.all(50),
                alignment: AlignmentDirectional.center,
                height: 50,
                child: Text(
                  "Choose Your Interests",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 3, 195),
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                child: Elements("Cricket", "Coding", "Anime"),
              ),
              Container(
                child: Elements("Football", "Books", "Marvel"),
              ),
              Container(
                child: Elements("Songs", "Cars", "Movies"),
              ),
              Container(
                child: Elements("Memes", "Painting", "Startup"),
              ),
              Container(
                child: Elements("Guitar", "Science", "Cooking"),
              ),
              Container(
                child: Elements("Harry Potter", "Travel", "Batman"),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 3, 195),
                ),
                child: FlatButton(
                  onPressed: () {
                    print('$myList');

                    showAlertDialog(context);
                  },
                  child: const Text(
                    "Done",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container ForEach(String e1) {
    var select = false;
    return Container(
      height: 80,
      width: 125,
      margin: EdgeInsets.all(11.5),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: select ? Color.fromARGB(255, 0, 3, 195) : Colors.grey,
        ),
      ),
      child: FlatButton(
        highlightColor: Colors.blue,
        child: Text(
          e1,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 3, 195),
            fontSize: 20,
          ),
        ),
        onPressed: () async {
          // setState(() {
          //   select = !select;
          // });
          print(select);
          myList.add(e1);
          print(e1);
        },
      ),
    );
  }

  Row Elements(String e1, String e2, String e3) {
    return Row(
      children: [
        ForEach(e1),
        ForEach(e2),
        ForEach(e3),
      ],
    );
  }
}
