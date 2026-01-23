import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key, required this.onTap, required this.text});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeManager.s171,
        height: SizeManager.s60,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(
              color: ColorManager.white, width: SizeManager.s2)),
          borderRadius: BorderRadius.circular(SizeManager.s50),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorManager.secondaryBlue, ColorManager.accentSkyBlue],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: ColorManager.white,
            fontWeight: FontWeight.w500,
            fontSize: SizeManager.s16,
          ),
        ),
      ),
    );
  }
}
