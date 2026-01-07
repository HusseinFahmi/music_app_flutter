import 'package:flutter/material.dart';
import 'package:music_app/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashController.navigateToOnBoardingPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0b1f41), Color(0xff464646)],
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/splashScreenImage.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
