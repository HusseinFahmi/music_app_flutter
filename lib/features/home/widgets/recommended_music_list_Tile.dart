import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';

import 'custom_list_tile_recommended_music.dart';

class RecommendedMusicList extends StatelessWidget {
  const RecommendedMusicList({
    super.key,
    required this.onTap,
    required this.songModel,
    required this.itemCount,
  });

  final void Function() onTap;
  final List<SongModel> songModel;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: onTap,
        child: CustomListTileRecommendedMusic(songModel: songModel[index]),
      ),
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: itemCount,
    );
  }
}
