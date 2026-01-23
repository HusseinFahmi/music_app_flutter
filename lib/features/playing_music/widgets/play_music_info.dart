import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';

import '../../../core/components/custom_text_box.dart';
import '../../../models/song_model.dart';

class PlayMusicInfo extends StatelessWidget {
  const PlayMusicInfo({
    super.key,
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(SizeManager.s10),
          child: Image.asset(
            song.imagePath,
            fit: BoxFit.cover,
            height: SizeManager.s261,
            width: SizeManager.s247,
          ),
        ),
        const SizedBox(height: SizeManager.s23),
        CustomTextBox(
          title: song.songName,
          color: ColorManager.white,
          size: SizeManager.s18,
        ),
        const SizedBox(height: SizeManager.s4_0),
        CustomTextBox(
          title: song.singerName,
          color: ColorManager.secondaryColor,
          size: SizeManager.s12,
        ),
      ],
    );
  }
}
