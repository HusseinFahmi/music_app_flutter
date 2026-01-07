import 'package:flutter/material.dart';

class CustomSkipIconContainer extends StatelessWidget {
  const CustomSkipIconContainer({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff854F9F), Color(0xffB1AFE9)],
        ),
      ),
      child: Icon(icon, size: 30, color: Colors.white),
    );
  }
}
