import 'package:flutter/material.dart';
import 'package:music_app/controller/on_boarding_controller.dart';
import 'package:music_app/features/on_boarding/widgets/on_boarding_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff411f5c), Color(0xff261f5c)],
            stops: [0.0, 0.54],
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 111),
            Text(
              'Find Your\nFavourite',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 50,
                height: 1.2,
                letterSpacing: 5,
              ),
            ),

            Text(
              'Music',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 50,
                color: Color(0xff80CFF2),
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text(
                'Find Your Latest Favourite Music\nFrom Our Collection',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 58),

            OnBoardingButton(
              onTap: () => OnBoardingController.navigateToHomePage(context),
              text: 'Get Started',
            ),

            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Image.asset(
                        "assets/images/onBoardingPerson.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff3097C5).withAlpha(4),
                            Color(0xff411F5C),
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
