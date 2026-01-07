import 'package:flutter/material.dart';
import 'package:music_app/features/main_page/screens/main_page.dart';
import 'package:music_app/features/playing_music/screens/play_music_screen.dart';
import 'package:music_app/features/splash/screens/splash_screen.dart';

import '../../features/on_boarding/screens/on_boarding_screen.dart';

class RouteManager {
  static Map<String, WidgetBuilder> routes = {
    RouteName.splashScreen: (context) => SplashScreen(),
    RouteName.onBoardingScreen: (context) => OnBoardingScreen(),
    RouteName.mainPage: (context) => MainPage(),
    RouteName.playMusicScreen: (context) => PlayMusicScreen(),
  };
}

class RouteName {
  static const String splashScreen = 'splashScreen';
  static const String onBoardingScreen = 'onBoarding';
  static const String mainPage = 'mainPage';
  static const String playMusicScreen = 'playMusicScreen';
}
