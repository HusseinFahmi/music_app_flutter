import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
import 'package:music_app/core/resources/strings_manager.dart';

import '../../../core/components/custom_text_box.dart';

class CustomPlayMusicAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomPlayMusicAppBar({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_left, color: ColorManager.white),
      ),
      title: CustomTextBox(title: StringsManager.nowPlaying,
          color: ColorManager.white,
          size: SizeManager.s18),
      backgroundColor: Colors.transparent,

      actions: const [
        Icon(Icons.share, size: SizeManager.s20, color: ColorManager.white),
        SizedBox(width: SizeManager.s22),
        Icon(Icons.more_vert, size: SizeManager.s20, color: ColorManager.white),
        SizedBox(width: 13),
      ],
    );
  }
}
