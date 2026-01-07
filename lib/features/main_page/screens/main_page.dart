import 'package:flutter/material.dart';
import 'package:music_app/controller/main_home_controller.dart';
import 'package:music_app/features/main_page/widgets/custom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainPage> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: HomeController.pages),

      bottomNavigationBar: CustomNavBar(
        index: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
