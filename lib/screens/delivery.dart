import 'package:flutter/material.dart';

class MyDelivery extends StatefulWidget {
  @override
  _MyDeliveryState createState() => _MyDeliveryState();
}

class _MyDeliveryState extends State<MyDelivery> {
  // Explicit

  // Methods

  Widget picture1(String path, String foodName) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8.0),
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset(path),
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              foodName,
              style: TextStyle(letterSpacing: 2.0),
            ),
          )
        ],
      ),
    );
  }

  Widget textHeader() {
    return Container(
      padding: EdgeInsets.only(top: 16.0, left: 16.0),
      alignment: Alignment.bottomLeft,
      child: Text(
        "Popular restaurants in Kathmandu",
        style: TextStyle(fontSize: 16.0, letterSpacing: 1.5),
      ),
    );
  }

  Widget foodRow1() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          picture1('images/food5.jpg', 'Pasta'),
          picture1('images/food5.jpg', 'Spagetthi'),
        ],
      ),
    );
  }

  Widget foodShow2() {
    return Container(
      padding: EdgeInsets.only(top: 16.0, left: 16.0),
      alignment: Alignment.bottomLeft,
      child: Column(
        children: <Widget>[
          Text(
            "Food Recomendations for you",
            style: TextStyle(fontSize: 16.0, letterSpacing: 1.5),
          ),
          mySizeBox(),
          imageInFoodShow2(),
          mySizeBox(),
          imageInFoodShow2(),
          mySizeBox(),
          imageInFoodShow2(),
          mySizeBox(),
          imageInFoodShow2()
        ],
      ),
    );
  }

  Widget imageInFoodShow2() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Image.asset('images/food6.jpg'),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.topLeft,
                        child: Text("LoremIpsum"),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Hello World",
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 16.0),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.382,
                  child: Icon(
                    Icons.linked_camera,
                    size: 36.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget mySizeBox() {
    return Container(
      width: 10.0,
      height: 10.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              textHeader(),
              foodRow1(),
              foodRow1(),
              mySizeBox(),
              foodShow2(),
            ],
          ),
        )
      ],
    );
  }
}
