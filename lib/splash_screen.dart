import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'home.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState(){
    super.initState();
    navigateHome();
  }

  navigateHome() async{
    await Future.delayed(Duration(seconds: 5),(){});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder:(context) => mainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child:Image.asset(
            'quotes.jpg',
            height: 100,
            width: 100,
            scale: 2.5,
          ) ,
        ),
        SizedBox(height: 50),
        DefaultTextStyle(
          style: TextStyle(),
          child:Text(
              'QUOTS',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
                color: Colors.black,

              ),
        ),
        ),
            SizedBox(height: 50),
            SpinKitWave(
              color: Colors.amber,
              size: 50.0,
            )
          ],
        )
    );
  }
}

