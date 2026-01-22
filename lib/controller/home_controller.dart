import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:music_app/core/resources/constant_values.dart';
import 'package:music_app/core/resources/route_manager.dart';
import 'package:music_app/models/home_ui_state.dart';

import '../models/song_model.dart';

class HomeController {
  static void navigateToPlayMusic({
    required BuildContext context,
    required SongModel? song,
  }) {
    Navigator.pushNamed(context, RouteName.playMusicScreen, arguments: song);
  }

  final TextEditingController controller = TextEditingController();

  final ValueNotifier<HomeUiState> homeUiState = ValueNotifier(
    HomeUiState(isSearchEnabled: false, searchedSongs: const []),
  );

  HomeController() {
    controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final text = controller.text.trim();

    if (text.isEmpty) {
      homeUiState.value = HomeUiState(
        isSearchEnabled: false,
        searchedSongs: const [],
      );
      return;
    }

    final results = ConstantValues.quranList
        .where((e) => e.songName.toLowerCase().contains(text.toLowerCase()))
        .toList();

    homeUiState.value = HomeUiState(
      isSearchEnabled: true,
      searchedSongs: results,
    );
  }

  void closeSearch() {
    controller.clear();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  void dispose() {
    controller.removeListener(_onSearchChanged);
    controller.dispose();
  }
}
