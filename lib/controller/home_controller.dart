import 'package:flutter/cupertino.dart';
import 'package:music_app/core/resources/route_manager.dart';

import '../models/song_model.dart';

class HomeController {
  static void navigateToPlayMusic({
    required BuildContext context,
    required SongModel song,
  }) {
    Navigator.pushNamed(context, RouteName.playMusicScreen, arguments: song);
  }
}
