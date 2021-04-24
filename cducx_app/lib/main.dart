import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main() {
  runApp(Covid());
}

class Covid extends StatelessWidget {
  // This widget is the root of your application.
  final bool debugShowCheckedModeBanner = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashscreen(),
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFFF7F7F7),
        scaffoldBackgroundColor: Color(0xFFF7F7F7),
      ),
    );
  }
}
