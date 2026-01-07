import 'package:flutter/material.dart';
import 'package:music_app/core/components/custom_text_box.dart';
import 'package:music_app/models/song_model.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({super.key, required this.songModel});

  final SongModel songModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            songModel.imagePath,
            width: 151,
            height: 151,
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(height: 9),

        CustomTextBox(title: songModel.songName, color: Colors.white, size: 15),
        CustomTextBox(
          title: songModel.singerName,
          color: Color(0xffB1AFE9),
          size: 12,
        ),
      ],
    );
  }
}
