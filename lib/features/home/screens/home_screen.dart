import 'package:flutter/material.dart';
import 'package:music_app/controller/home_controller.dart';
import 'package:music_app/core/components/custom_text_box.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/constant_values.dart';
import 'package:music_app/core/resources/gradient_manager.dart';
import 'package:music_app/core/resources/margin_manager.dart';
import 'package:music_app/core/resources/padding_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
import 'package:music_app/core/resources/strings_manager.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: GradientManager.mainBackground),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: PaddingManager.homeSearchPadding,
                child: ValueListenableBuilder<HomeUiState>(
                  valueListenable: _homeController.homeUiState,
                  builder: (_, value, _) {
                    return CustomTextFieldHomepage(
                      isSearchEnabled: value.isSearchEnabled,
                      onTapSearchClose: () => _homeController.closeSearch(),
                      controller: _homeController.controller,
                    );
                  },
                ),
              ),

              ValueListenableBuilder<HomeUiState>(
                valueListenable: _homeController.homeUiState,
                builder: (_, value, _) {
                  if (!value.isSearchEnabled) return SizedBox.shrink();
                  if (_homeController.controller.text.isEmpty) {
                    return SizedBox.shrink();
                  }
                  return value.searchedSongs.isEmpty
                      ? Container(
                    margin: MarginManager.verticalLarge,
                    child: Center(
                      child: CustomTextBox(
                        title: StringsManager.noDataFound,
                        color: ColorManager.white,
                        size: SizeManager.s15,
                      ),
                    ),
                  )
                      : Column(
                    children: [
                      const CategoryTextBox(
                          text: StringsManager.recentlyPlayed),

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

              const CategoryTextBox(text: StringsManager.recommendedMusic),

              const SizedBox(height: SizeManager.s10),

              RecommendedMusicList(
                onTap: (index) =>
                    HomeController.navigateToPlayMusic(
                      context: context,
                      song: quranList[index],
                    ),
                songModel: quranList,
                itemCount: quranList.length,
              ),

              const SizedBox(height: SizeManager.s5),
            ],
          ),
        ),),
    );
  }
}
