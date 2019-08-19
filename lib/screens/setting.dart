import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neungflutter/screens/myservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySetting extends StatefulWidget {
  @override
  _MySettingState createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  // Explicit
  String userId, username, password;
  TextEditingController textEditingController;
  TextEditingController textEditingController2;
  final formKey = GlobalKey<FormState>();
  Firestore firestore = Firestore.instance;
  @override
  void initState() {
    super.initState();
    getUserId();
  }

  Widget usernameText() {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: "Username",
          helperText: "Your Username",
        ),
        onSaved: (String value) {
          username = value.trim();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      child: TextFormField(
        controller: textEditingController2,
        decoration: InputDecoration(
          labelText: "Password",
          helperText: "Your Password",
        ),
        onSaved: (String value) {
          password = value.trim();
        },
      ),
    );
  }

  Widget okButton() {
    return Container(
      child: RaisedButton(
        child: Text(
          "Confirm",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        onPressed: () {
          formKey.currentState.save();
          updateUserInfo();
        },
      ),
    );
  }

  Future<void> getUserId() async {
    final pref = await SharedPreferences.getInstance();

    userId = pref.getString("userId");
    await firestore
        .collection("Account")
        .document(userId)
        .get()
        .then((DocumentSnapshot doc) {
      setState(() {
        username = doc.data['username'];
        password = doc.data['password'];
        textEditingController =
            TextEditingController(text: doc.data['username']);
        textEditingController2 =
            TextEditingController(text: doc.data['password']);
      });
    });
  }

  Future<void> updateUserInfo() async {
    firestore.collection("Account").document(userId).setData(
      {'username': username, 'password': password},
    ).then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  Widget showForm() {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            usernameText(),
            passwordText(),
            okButton(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            showForm(),
          ],
        ),
      ),
    );
  }
}
