import 'package:flutter/material.dart';
import 'package:music_app/core/components/custom_text_box.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
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
          borderRadius: BorderRadius.circular(SizeManager.s15),
          child: Image.asset(
            songModel.imagePath,
            width: SizeManager.s151,
            height: SizeManager.s151,
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(height: SizeManager.s9),

        CustomTextBox(title: songModel.songName,
            color: ColorManager.white,
            size: SizeManager.s15),
        CustomTextBox(
          title: songModel.singerName,
          color: ColorManager.secondaryColor,
          size: SizeManager.s12,
        ),
      ],
    );
  }
}
