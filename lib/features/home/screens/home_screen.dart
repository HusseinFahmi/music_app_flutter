import 'package:flutter/material.dart';
import 'package:music_app/controller/home_controller.dart';
import 'package:music_app/core/resources/constant_values.dart';
import 'package:music_app/features/home/widgets/category_text_box.dart';
import 'package:music_app/features/home/widgets/custom_text_field_homepage.dart';
import 'package:music_app/features/home/widgets/recommended_music_list_Tile.dart';
import 'package:music_app/models/home_ui_state.dart';
import 'package:music_app/models/song_model.dart';

import '../widgets/recently_palyed_list.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  final List<SongModel> quranList = ConstantValues.quranList;
  final HomeController _homeController = HomeController();

  // List<SongModel> get searchedSongs => _homeController.homeUiState.value.searchedSongs;

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
                child: ValueListenableBuilder<HomeUiState>(
                    valueListenable: _homeController.homeUiState,
                    builder: (_, value, _) {
                      return CustomTextFieldHomepage(
                        isSearchEnabled: value.isSearchEnabled,
                        onTapSearchClose: () => _homeController.closeSearch(),
                        controller: _homeController.controller,
                      );
                    }
                ),
              ),

              ValueListenableBuilder<HomeUiState>(
                valueListenable: _homeController.homeUiState,
                builder: (_, value, _) {
                  if (!value.isSearchEnabled) return SizedBox.shrink();
                  if (_homeController.controller.text.isEmpty)
                    return SizedBox.shrink();
                  return value.searchedSongs.isEmpty ? SizedBox(
                    child: Center(child: Text("No Data Found", style: TextStyle(
                        color: Colors.white),),),) :
                  Column(
                    children: [
                      const CategoryTextBox(text: 'Recently Played'),

                      RecentlyPlayedList(
                        itemCount: value.searchedSongs.length,
                        songModel: value.searchedSongs,
                        onTap: (index) =>
                            HomeController.navigateToPlayMusic(
                              context: context,
                              song: value.searchedSongs[index],
                            ),
                      ),
                    ],
                  );
                },
              ),

              const CategoryTextBox(text: 'Recommended music'),

              const SizedBox(height: 10),

              RecommendedMusicList(
                onTap: (index) =>
                    HomeController.navigateToPlayMusic(
                      context: context,
                      song: quranList[index],
                    ),
                songModel: quranList,
                itemCount: quranList.length,
              ),

              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
