import 'package:flutter/material.dart';

class MyFlashcard extends StatefulWidget {
  @override
  _MyFlashcardState createState() => _MyFlashcardState();
}

class _MyFlashcardState extends State<MyFlashcard> {
  // EXPLICIT

  Widget mySizeBox() {
    return Container(
      width: 10.0,
      height: 10.0,
    );
  }

  Widget eachCard() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: FlatButton(
        onPressed: () {},
        child: Container(
          color: Colors.blue[700],
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Dog",
              style: TextStyle(
                fontSize: 24,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showFlashcard() {
    return ListView(
      children: <Widget>[
        Wrap(
          children: <Widget>[for (var i = 0; i < 50; i++) eachCard()],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showFlashcard(),
    );
  }
}
