import 'package:flutter/cupertino.dart';
import 'package:music_app/core/resources/route_manager.dart';

class HomeController {
  static void navigateToPlayMusic({required BuildContext context}) {
    Navigator.pushNamed(context, RouteName.playMusicScreen);
  }
}
