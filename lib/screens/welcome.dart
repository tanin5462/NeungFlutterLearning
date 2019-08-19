import 'package:flutter/material.dart';

class MyWelcome extends StatefulWidget {
  @override
  _MyWelcomeState createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {
  // Widget
  Widget showLogo() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Image.asset('images/myLogo.png'),
    );
  }

  Widget showAppName() {
    return Container(
      child: Text(
        "Welcome",
        style: TextStyle(
          fontSize: 36,
          color: Colors.white,
          letterSpacing: 4.0,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(1.0, 5.0),
              blurRadius: 1.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            Shadow(
                // bottomLeft
                offset: Offset(-1.5, -1.5),
                blurRadius: 5.0,
                color: Colors.blueGrey),
            Shadow(
                // bottomRight
                offset: Offset(1.5, -1.5),
                blurRadius: 5.0,
                color: Colors.blueGrey),
            Shadow(
                // topRight
                offset: Offset(1.5, 1.5),
                blurRadius: 5.0,
                color: Colors.blueGrey),
            Shadow(
                // topLeft
                offset: Offset(-1.5, 1.5),
                blurRadius: 5.0,
                color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showLogo(),
          showAppName(),
        ],
      ),
    );
  }
}
