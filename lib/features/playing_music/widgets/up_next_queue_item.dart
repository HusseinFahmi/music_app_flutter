import 'package:flutter/material.dart';
import 'package:music_app/features/playing_music/widgets/up_next_track_tile.dart';

import '../../../core/components/custom_text_box.dart';

class UpNextQueueItem extends StatelessWidget {
  const UpNextQueueItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 34, vertical: 18),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xffB1AFE9).withAlpha(70),
      ),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextBox(title: 'Up Next', color: Colors.white, size: 8),
                Container(
                  width: 52,
                  height: 16,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff8A86F4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomTextBox(
                    title: 'Queue >',
                    color: Colors.white,
                    size: 8,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          UpNextTrackTile(),
        ],
      ),
    );
  }
}
