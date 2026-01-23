import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
import 'package:music_app/core/resources/strings_manager.dart';

import 'action_item.dart';

class TrackActionsBar extends StatelessWidget {
  const TrackActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeManager.s65, vertical: SizeManager.s14),
      padding: EdgeInsets.symmetric(
          horizontal: SizeManager.s20, vertical: SizeManager.s7),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.s10)),
        color: ColorManager.secondaryColor.withAlpha(70),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionItem(icon: Icons.favorite_border, label: StringsManager.like),
          ActionItem(icon: Icons.queue_music, label: StringsManager.playlist),
          ActionItem(icon: Icons.file_download_outlined,
              label: StringsManager.download),
          ActionItem(icon: Icons.more_vert, label: StringsManager.more),
        ],
      ),
    );
  }
}
