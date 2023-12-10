import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
