import 'package:flutter/material.dart';
import 'package:music_app/controller/main_home_controller.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.index, required this.onTap});

  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff854F9F),
      backgroundColor: const Color(0xff261F44),
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,

      items: [
        for (int i = 0; i < HomeController.homeIcon.length; i++)
          BottomNavigationBarItem(icon: HomeController.homeIcon[i], label: ''),
      ],
    );
  }
}
