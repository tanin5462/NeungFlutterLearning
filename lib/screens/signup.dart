import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neungflutter/screens/myservice.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Explicit
  String username, password, name, lastname;
  Firestore firestore = Firestore.instance;
  final formKey = GlobalKey<FormState>();
  bool checkExists = false;
  // Methods

  Widget showSignUpForm() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          usernameText(),
          mySizeBox(),
          passwordText(),
          mySizeBox(),
          nameText(),
          mySizeBox(),
          lastName(),
          mySizeBox(),
        ],
      ),
    );
  }

  Widget mySizeBox() {
    return Container(
      width: 16,
      height: 16,
    );
  }

  Widget usernameText() {
    return TextFormField(
      // autofocus: true,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Please type your Username",
        icon: Icon(
          Icons.account_box,
        ),
      ),
      validator: (String value) {
        value = value.trim();
        if (value.length < 6) {
          return "Username must be more than 6 character";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        username = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Please type your Password",
        icon: Icon(Icons.lock),
      ),
      validator: (String value) {
        value = value.trim();
        if (value.length < 6) {
          return "Password must me more than 6 character";
        }
      },
      onSaved: (String value) {
        password = value.trim();
      },
    );
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Please type your Name",
        icon: Icon(Icons.lock),
      ),
      validator: (String value) {
        value = value.trim();
        if (value.length < 1) {
          return "Please fill in your name";
        }
      },
      onSaved: (String value) {
        name = value.trim();
      },
    );
  }

  Widget lastName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "LastName",
        hintText: "Mayer",
        icon: Icon(
          Icons.supervisor_account,
        ),
      ),
      validator: (String value) {
        value = value.trim();
        if (value.length < 1) {
          return "Please fill in your lastname";
        }
      },
      onSaved: (String value) {
        lastname = value.trim();
      },
    );
  }

  Widget registerButton() {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        if (formKey.currentState.validate()) {
          // print(
          //     'username = $username , password = $password , name = $name , lastname = $lastname ');
          formKey.currentState.save();
          register();
        }
      },
      child: Container(
        child: Text(
          "Register",
          style: TextStyle(
              fontFamily: 'MyFont',
              fontWeight: FontWeight.normal,
              fontSize: 24.0),
        ),
      ),
    );
  }

  Future<void> register() async {
    // await checkExistsUser();
    if (checkExists == false) {
      await firestore.collection('Account').document().setData({
        'username': username,
        'password': password,
        'name': name,
        'lastname': lastname
      });
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  // Future<void> checkExistsUser() async {
  //   firestore
  //       .collection('Account')
  //       .where("username", isEqualTo: username)
  //       .snapshots()
  //       .listen((data) =>
  //           data.documents.forEach((doc) => checkExists = doc.exists));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[showSignUpForm(), registerButton()],
        ),
      ),
    );
  }
}
