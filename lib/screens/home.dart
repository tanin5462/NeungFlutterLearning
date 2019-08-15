import 'package:flutter/material.dart';
import 'package:neungflutter/screens/signin.dart';
import 'package:neungflutter/screens/signup.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit

  // Methods
  Widget showLogo() {
    return Container(
      width: 100,
      child: Image.asset('images/myLogo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      "Let\'s Travel",
      style: TextStyle(
          fontSize: 36,
          color: Colors.white,
          letterSpacing: 3.0,
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
          ]),
    );
  }

  Widget mySizeBox() {
    return Container(
      width: 12.0,
      height: 12.0,
    );
  }

  Widget showButton() {
    return Row(
      children: <Widget>[
        mySizeBox(),
        signInButton(),
        mySizeBox(),
        signUpButton(),
        mySizeBox()
      ],
    );
  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        color: Colors.indigo[50],
        onPressed: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignIn());
          Navigator.of(context).push(materialPageRoute);
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'SignIn',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'MyFont',
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[700],
                letterSpacing: 2.0),
          ),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: RaisedButton(
        color: Colors.indigo[50],
        onPressed: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignUp());
          Navigator.of(context).push(materialPageRoute);
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'SignUp',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'MyFont',
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[700],
                letterSpacing: 2.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            mySizeBox(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
