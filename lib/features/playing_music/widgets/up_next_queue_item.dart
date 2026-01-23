import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
import 'package:music_app/core/resources/strings_manager.dart';
import 'package:music_app/features/playing_music/widgets/up_next_track_tile.dart';

import '../../../core/components/custom_text_box.dart';

class UpNextQueueItem extends StatelessWidget {
  const UpNextQueueItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeManager.s10),
      margin: EdgeInsets.symmetric(
          horizontal: SizeManager.s34, vertical: SizeManager.s18),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.s10)),
        color: ColorManager.secondaryColor.withAlpha(70),
      ),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeManager.s14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextBox(title: StringsManager.upNext,
                    color: ColorManager.white,
                    size: SizeManager.s8),
                Container(
                  width: SizeManager.s52,
                  height: SizeManager.s16,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorManager.periwinkleBlue,
                    borderRadius: BorderRadius.circular(SizeManager.s10),
                  ),
                  child: CustomTextBox(
                    title: StringsManager.queue,
                    color: ColorManager.white,
                    size: SizeManager.s8,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeManager.s8),
          UpNextTrackTile(),
        ],
      ),
    );
  }
}
