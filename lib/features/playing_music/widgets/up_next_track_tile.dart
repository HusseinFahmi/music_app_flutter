import 'package:flutter/material.dart';

import '../../../core/components/custom_text_box.dart';
import '../../../core/resources/image_manager.dart';

class UpNextTrackTile extends StatelessWidget {
  const UpNextTrackTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          ImageManager.justinBieber,
          height: 55,
          width: 55,
          fit: BoxFit.cover,
        ),
      ),
      title: CustomTextBox(
        title: 'sing me to sleep ',
        color: Colors.white,
        size: 15,
      ),
      subtitle: CustomTextBox(
        title: 'alan walker',
        color: Color(0xffB1AFE9),
        size: 12,
      ),
      trailing: Icon(Icons.skip_next_outlined, color: Colors.white),
    );
  }
}
