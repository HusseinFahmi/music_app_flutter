import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';

class CustomSkipIconContainer extends StatelessWidget {
  const CustomSkipIconContainer({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeManager.s36,
      width: SizeManager.s36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeManager.s20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorManager.accentPurple, ColorManager.secondaryColor],
        ),
      ),
      child: Icon(icon, size: SizeManager.s30, color: ColorManager.white),
    );
  }
}
