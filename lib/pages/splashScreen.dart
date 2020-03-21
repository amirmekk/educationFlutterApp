import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:tarikh19/pages/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: 'icon/logo.jpg',
      home: Home(),
      duration: 1500,
      type: AnimatedSplashType.StaticDuration,
    );
  }
}
