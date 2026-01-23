import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';

import '../../../core/components/custom_text_box.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: ColorManager.white),
        SizedBox(height: SizeManager.s2),
        CustomTextBox(
            title: label, color: ColorManager.white, size: SizeManager.s8),
      ],
    );
  }
}
