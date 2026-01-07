import 'package:flutter/material.dart';
import 'package:music_app/controller/main_home_controller.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.onTap});

  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff261F44),
      onTap: onTap,
      items: [
        for (int i = 0; i < HomeController.homeIcon.length; i++)
          BottomNavigationBarItem(icon: HomeController.homeIcon[i], label: ''),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
    );
  }
}
