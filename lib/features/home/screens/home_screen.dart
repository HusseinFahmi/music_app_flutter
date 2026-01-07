import 'package:flutter/material.dart';
import 'package:music_app/controller/home_controller.dart';
import 'package:music_app/core/resources/constant_values.dart';
import 'package:music_app/features/home/widgets/category_text_box.dart';
import 'package:music_app/features/home/widgets/custom_text_field_homepage.dart';
import 'package:music_app/features/home/widgets/recommended_music_list_Tile.dart';

import '../widgets/recently_palyed_list.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff411F5C), Color(0xff261F5C)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 41,
                  left: 31,
                  right: 31,
                  bottom: 15,
                ),
                child: CustomTextFieldHomepage(),
              ),

              CategoryTextBox(text: 'Recently Played'),

              RecentlyPlayedList(
                itemCount: ConstantValues.quranList.length,
                songModel: ConstantValues.quranList,
                onTap: () =>
                    HomeController.navigateToPlayMusic(context: context),
              ),

              CategoryTextBox(text: 'Recommended music'),

              SizedBox(height: 10),

              RecommendedMusicList(
                onTap: () =>
                    HomeController.navigateToPlayMusic(context: context),
                songModel: ConstantValues.quranList,
                itemCount: ConstantValues.quranList.length,
              ),

              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
