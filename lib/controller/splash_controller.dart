import 'package:flutter/material.dart';

import '../core/resources/route_manager.dart';

class SplashController {
  static void navigateToOnBoardingPage(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, RouteName.onBoardingScreen),
    );
  }
}
