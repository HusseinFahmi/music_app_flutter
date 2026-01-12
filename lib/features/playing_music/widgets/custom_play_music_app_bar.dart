import 'package:flutter/material.dart';

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
        icon: Icon(Icons.arrow_left, color: Colors.white),
      ),
      title: CustomTextBox(title: 'Now playing', color: Colors.white, size: 18),
      backgroundColor: Colors.transparent,

      actions: const [
        Icon(Icons.share, size: 20, color: Colors.white),
        SizedBox(width: 22),
        Icon(Icons.more_vert, size: 20, color: Colors.white),
        SizedBox(width: 13),
      ],
    );
  }
}
