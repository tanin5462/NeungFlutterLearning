import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neungflutter/screens/bmi_program.dart';
import 'package:neungflutter/screens/calculator_program.dart';
import 'package:neungflutter/screens/delivery.dart';
import 'package:neungflutter/screens/flashcard.dart';
import 'package:neungflutter/screens/home.dart';
import 'package:neungflutter/screens/setting.dart';
import 'package:neungflutter/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  Widget myWidget = MyWelcome();
  String barName = "Welcome";
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
      width: 50,
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
          mySetting(),
          myLogo(),
          mySizeBox(),
          myAppName(),
        ],
      ),
    );
  }

  Widget mySetting() {
    return Container(
      alignment: Alignment.bottomRight,
      child: IconButton(
        iconSize: 30.0,
        icon: Icon(
          FontAwesomeIcons.cog,
          color: Colors.black87,
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => MySetting());
          Navigator.of(context).push(materialPageRoute);
        },
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
          myDeliveryMenu(),
          flashcardMenu(),
          logout()
        ],
      ),
    );
  }

  Widget myDeliveryMenu() {
    return ListTile(
      leading: Icon(
        Icons.directions_bike,
        size: 36.0,
        color: Colors.green,
      ),
      title: Text('Delivery'),
      onTap: () {
        setState(() {
          barName = "Delivery";
          myWidget = MyDelivery();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget flashcardMenu() {
    return ListTile(
      leading: Icon(
        Icons.account_box,
        size: 36.0,
        color: Colors.green,
      ),
      title: Text('Flashcard'),
      onTap: () {
        setState(() {
          barName = "Flashcard";
          myWidget = MyFlashcard();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget myFoodDeliveryRow() {
    return Row(
      children: <Widget>[],
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
        Icons.subdirectory_arrow_left,
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
    await prefs.setString('userId', null);
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
