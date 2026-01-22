import 'package:music_app/models/song_model.dart';

class HomeUiState {
  final bool isSearchEnabled;
  final List<SongModel> searchedSongs;

  const HomeUiState({
    required this.isSearchEnabled,
    required this.searchedSongs,
  });
}
