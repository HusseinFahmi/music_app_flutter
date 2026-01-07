import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/resources/route_manager.dart';

class OnBoardingController {
  static void navigateToHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, RouteName.mainPage);
  }
}
