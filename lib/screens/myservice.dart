import 'package:flutter/material.dart';
import 'package:neungflutter/screens/bmi_program.dart';
import 'package:neungflutter/screens/calculator_program.dart';
import 'package:neungflutter/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit

  Widget myWidget = MyBmi();
  String barName = "BMI";

  // Methods

  Widget myAppName() {
    return Text(
      "Let's travel",
      style: TextStyle(
          letterSpacing: 3.0,
          fontSize: 20,
          color: Colors.white,
          shadows: <Shadow>[
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

  Widget myLogo() {
    return Container(
      width: 80,
      child: Image.asset('images/myLogo.png'),
    );
  }

  Widget mySizeBox() {
    return Container(
      width: 16.0,
      height: 16.0,
    );
  }

  Widget myDrawerHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          Colors.white,
          Colors.blueGrey[700],
        ], radius: 1.5),
      ),
      child: Column(
        children: <Widget>[
          myLogo(),
          mySizeBox(),
          myAppName(),
        ],
      ),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myDrawerHead(),
          bmiMenu(),
          calculatorMenu(),
          logout()
        ],
      ),
    );
  }

  Widget bmiMenu() {
    return ListTile(
      leading: Icon(
        Icons.poll,
        size: 36.0,
        color: Colors.green,
      ),
      title: Text('Bmi Program'),
      onTap: () {
        setState(() {
          barName = "BMI";
          myWidget = MyBmi();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget calculatorMenu() {
    return ListTile(
      leading: Icon(
        Icons.airplay,
        size: 36.0,
        color: Colors.amber,
      ),
      title: Text('Calculator Program'),
      onTap: () {
        setState(() {
          barName = "Calculator";
          myWidget = MyCalculator();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget logout() {
    return ListTile(
      leading: Icon(
        Icons.airplay,
        size: 36.0,
        color: Colors.red,
      ),
      title: Text('Logout'),
      onTap: () {
        setLoginMode();
      },
    );
  }

  Future<void> setLoginMode() async {
    final prefs = await SharedPreferences.getInstance();
// set value
    await prefs.setInt('login', 0);
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => Home());
    Navigator.of(context)
        .pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawerMenu(),
      appBar: AppBar(
        title: Text(barName),
      ),
      body: Container(
        child: myWidget,
      ),
    );
  }
}
