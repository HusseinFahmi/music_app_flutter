import 'package:flutter/material.dart';
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
        color: Colors.white,
        size: 15,
      ),
      subtitle: CustomTextBox(
        title: songModel.singerName,
        color: Color(0xffB1AFE9),
        size: 12,
      ),
      leading: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(songModel.imagePath),
      ),
      trailing: Icon(Icons.favorite_border),
    );
  }
}
