import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'home_page.dart';
import 'requests.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // getImageJSON('http://192.168.1.25:5000/nst', 'Dog1', 'Kandinsky', 'false');
    getImageJSON('https://nstserver.herokuapp.com/nst', 'Dog1', 'Kandinsky', 'false');
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/neural_logo.jpg'),
      ),
    );
  }
}