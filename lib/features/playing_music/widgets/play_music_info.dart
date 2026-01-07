import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            song.imagePath,
            fit: BoxFit.cover,
            height: 261,
            width: 247,
          ),
        ),
        const SizedBox(height: 23),
        CustomTextBox(
          title: song.songName,
          color: Colors.white,
          size: 18,
        ),
        const SizedBox(height: 4),
        CustomTextBox(
          title: song.singerName,
          color: Color(0xffB1AFE9),
          size: 12,
        ),
      ],
    );
  }
}
