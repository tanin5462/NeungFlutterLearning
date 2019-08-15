import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neungflutter/screens/myservice.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Explicit
  String username, password;
  bool checkLogin = false;
  final formKey = GlobalKey<FormState>();

  // Methods
  Widget userNameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
        helperText: "Fill in your Username",
        labelStyle: TextStyle(color: Colors.black87),
        helperStyle: TextStyle(
          color: Colors.black87,
        ),
      ),
      validator: (String value) {
        if (value.trim().length < 1) {
          return "Please fill in your username";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        setState(() {
          username = value.trim();
        });
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "password",
        helperText: "Fill in your password",
        labelStyle: TextStyle(color: Colors.black87),
        helperStyle: TextStyle(
          color: Colors.black87,
        ),
      ),
      validator: (String value) {
        if (value.trim().length < 1) {
          return "Please fill in your password";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        setState(() {
          password = value.trim();
        });
      },
    );
  }

  Widget showInputText() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        gradient:
            LinearGradient(colors: [Colors.grey.withAlpha(200), Colors.white]),
      ),
      padding: EdgeInsets.only(left: 16.0, top: 16, bottom: 30, right: 16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[userNameText(), passwordText()],
        ),
      ),
    );
  }

  Widget mySizeBox() {
    return Container(
      width: 8,
      height: 16,
    );
  }

  Widget showLoginButton() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.7,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();

            myLogin();
          }
        },
      ),
    );
  }

  Future<void> myLogin() async {
    Firestore firestore = Firestore.instance;
    await firestore
        .collection("Account")
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .snapshots()
        .listen(
          (data) => data.documents.forEach(
            (doc) => checkLogin = doc.exists,
          ),
        );

    if (checkLogin) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).push(materialPageRoute);
    } else {
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[showInputText(), showLoginButton()],
          ),
        ),
      ),
    );
  }
}
