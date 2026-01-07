import 'package:flutter/material.dart';

import '../../../core/components/custom_text_box.dart';
import '../../../core/resources/image_manager.dart';

class PlayMusicInfo extends StatelessWidget {
  const PlayMusicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: AssetImage(ImageManager.selenaGomez),
            fit: BoxFit.cover,
            height: 261,
            width: 247,
          ),
        ),
        SizedBox(height: 23),
        CustomTextBox(title: 'NEW RULES', color: Colors.white, size: 18),
        SizedBox(height: 4),
        CustomTextBox(title: 'Dua Lipa', color: Color(0xffB1AFE9), size: 12),
      ],
    );
  }
}
