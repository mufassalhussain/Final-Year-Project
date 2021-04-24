import 'dart:async';
import 'package:flutter/material.dart';
import 'package:covid/screens/home_page.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple, // Color(0xFFD0DCF0),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 85,
            backgroundImage:
                AssetImage('assets/images/symptoms/ezgif-4-8ee6237f5057.gif'),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "WEAR A MASK\nMAINTAIN DISTANCE\nSTAY SAFE",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ],
      )),
    );
  }
}
