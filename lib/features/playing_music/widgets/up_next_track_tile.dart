import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';

import '../../../core/components/custom_text_box.dart';
import '../../../core/resources/image_manager.dart';

class UpNextTrackTile extends StatelessWidget {
  const UpNextTrackTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: SizeManager.s12),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(SizeManager.s10),
        child: Image.asset(
          ImageManager.justinBieber,
          height: SizeManager.s55,
          width: SizeManager.s55,
          fit: BoxFit.cover,
        ),
      ),
      title: CustomTextBox(
        title: 'sing me to sleep ',
        color: Colors.white,
        size: SizeManager.s15,
      ),
      subtitle: CustomTextBox(
        title: 'alan walker',
        color: ColorManager.secondaryColor,
        size: SizeManager.s12,
      ),
      trailing: Icon(Icons.skip_next_outlined, color: ColorManager.white),
    );
  }
}
