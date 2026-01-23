import 'package:flutter/material.dart';
import 'package:music_app/controller/on_boarding_controller.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/gradient_manager.dart';
import 'package:music_app/core/resources/image_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
import 'package:music_app/core/resources/strings_manager.dart';
import 'package:music_app/features/on_boarding/widgets/on_boarding_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: GradientManager.mainBackground,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: SizeManager.s111),
            Text(
              StringsManager.findYourFavourite,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: ColorManager.white,
                fontSize: SizeManager.s50,
                height: SizeManager.s1_2,
                letterSpacing: SizeManager.s5,
              ),
            ),

            Text(
              StringsManager.music,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: SizeManager.s50,
                color: ColorManager.accentSkyBlue,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: SizeManager.s16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeManager.s70),
              child: Text(
                StringsManager.subTile,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeManager.s15,
                  color: ColorManager.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: SizeManager.s58),

            OnBoardingButton(
              onTap: () => OnBoardingController.navigateToHomePage(context),
              text: StringsManager.getStarted,
            ),

            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Image.asset(
                        ImageManager.onBoardingPerson,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: SizeManager.s0,
                    right: SizeManager.s0,
                    left: SizeManager.s0,
                    child: Container(
                      height: SizeManager.s200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorManager.primaryBlue.withAlpha(SizeManager.s4),
                            ColorManager.backgroundMid,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
