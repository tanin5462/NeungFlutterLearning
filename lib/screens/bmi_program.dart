import 'package:flutter/material.dart';

class MyBmi extends StatefulWidget {
  @override
  _MyBmiState createState() => _MyBmiState();
}

class _MyBmiState extends State<MyBmi> {
  // Explicit
  var bmiResult, height, weight;
  bool isShowBmiResult = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  // Methods
  Widget showForm() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          heightText(),
          weightText(),
        ],
      ),
    );
  }

  Widget heightText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Height(In Meter)",
        helperText: "Your Height",
      ),
      onSaved: (String value) {
        height = value;
      },
    );
  }

  Widget weightText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Weight(In Kg)",
        helperText: "Your Weight",
      ),
      onSaved: (String value) {
        weight = value;
      },
    );
  }

  Widget showResult() {
    if (isShowBmiResult) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Your BMI",
                style: TextStyle(fontSize: 30.0, letterSpacing: 3.0),
              ),
              Container(
                height: 16.0,
              ),
              Text(
                bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 30.0, letterSpacing: 3.0),
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget calculateButton() {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: Text(
        "Calculate",
        style: TextStyle(letterSpacing: 2.0, fontSize: 20),
      ),
      onPressed: () {
        formKey.currentState.save();
        // print("height = $height , weight = $weight");
        var newWeight = double.parse(weight);
        var newHeight = double.parse(height) / 100;
        var powerOfHeight = newHeight * newHeight;
        print("newWeight = $newWeight, newHeight = $powerOfHeight");

        setState(() {
          bmiResult = newWeight / powerOfHeight;
          isShowBmiResult = true;
        });
      },
    );
  }

  Widget clearButton() {
    if (isShowBmiResult) {
      return RaisedButton(
        textColor: Colors.white,
        color: Colors.red[400],
        child: Text(
          "Clear",
          style: TextStyle(fontSize: 20, letterSpacing: 2.0),
        ),
        onPressed: () {
          setState(() {
            bmiResult = "";
            height = "";
            weight = "";
            isShowBmiResult = false;
          });
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: ListView(
          children: <Widget>[
            showForm(),
            showResult(),
            calculateButton(),
            clearButton(),
          ],
        ),
      ),
    );
  }
}
