import 'package:flutter/material.dart';
import 'package:music_app/core/resources/size_manager.dart';

import '../../../models/song_model.dart';
import 'recently_played.dart';

class RecentlyPlayedList extends StatelessWidget {
  const RecentlyPlayedList({
    super.key,
    required this.songModel,
    required this.itemCount,
    required this.onTap,
  });

  final List<SongModel> songModel;
  final int itemCount;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeManager.s232,
      padding: EdgeInsets.all(SizeManager.s15),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () => onTap(index),
          child: RecentlyPlayed(songModel: songModel[index]),
        ),
        separatorBuilder: (context, index) => SizedBox(width: SizeManager.s17),
        itemCount: itemCount,
      ),
    );
  }
}
