import 'package:flutter/material.dart';
import 'package:music_app/features/favorite/screens/favorite_screen.dart';
import 'package:music_app/features/home/screens/home_screen.dart';
import 'package:music_app/features/list/screens/list_screen.dart';
import 'package:music_app/features/menu/screens/menu_screen.dart';
import 'package:music_app/features/settings/screens/settings_screen.dart';

class HomeController {
  static List<Icon> homeIcon = [
    Icon(Icons.menu),
    Icon(Icons.home_outlined),
    Icon(Icons.favorite_border),
    Icon(Icons.list),
    Icon(Icons.settings),
  ];

  static List<Widget> pages = [
    MenuScreen(),
    HomeContent(),
    FavoriteScreen(),
    ListScreen(),
    SettingsScreen(),
  ];
}
