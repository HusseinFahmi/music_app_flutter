import 'package:flutter/material.dart';
import 'package:music_app/core/resources/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RouteManager.routes,

      initialRoute: RouteName.splashScreen,

      theme: ThemeData(fontFamily: 'Orbitron', platform: TargetPlatform.iOS),
    );
  }
}
