import 'package:flutter/material.dart';

import 'action_item.dart';

class TrackActionsBar extends StatelessWidget {
  const TrackActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 65, vertical: 14),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xffB1AFE9).withAlpha(70),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionItem(icon: Icons.favorite_border, label: 'Like'),
          ActionItem(icon: Icons.queue_music, label: 'Playlist'),
          ActionItem(icon: Icons.file_download_outlined, label: 'Download'),
          ActionItem(icon: Icons.more_vert, label: 'More'),
        ],
      ),
    );
  }
}
