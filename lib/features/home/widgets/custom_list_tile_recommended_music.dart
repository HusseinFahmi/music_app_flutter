import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
import 'package:music_app/models/song_model.dart';

import '../../../core/components/custom_text_box.dart';

class CustomListTileRecommendedMusic extends StatelessWidget {
  const CustomListTileRecommendedMusic({super.key, required this.songModel});

  final SongModel songModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomTextBox(
        title: songModel.songName,
        color: ColorManager.white,
        size: SizeManager.s15,
      ),
      subtitle: CustomTextBox(
        title: songModel.singerName,
        color: ColorManager.secondaryColor,
        size: SizeManager.s12,
      ),
      leading: CircleAvatar(
        radius: SizeManager.s35,
        backgroundImage: AssetImage(songModel.imagePath),
      ),
      trailing: Icon(Icons.favorite_border),
    );
  }
}
