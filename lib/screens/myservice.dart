import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  Widget myDrawerHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          Colors.white,
          Colors.blueGrey[700],
        ], radius: 1.5),
      ),
      child: Column(
        children: <Widget>[],
      ),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myDrawerHead(),
          bmiMenu(),
        ],
      ),
    );
  }

  Widget bmiMenu() {
    return ListTile(
      leading: Icon(
        Icons.video_call,
        size: 36.0,
      ),
      title: Text('Bmi Program'),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawerMenu(),
      appBar: AppBar(),
      body: Center(
        child: Text("MyService"),
      ),
    );
  }
}
