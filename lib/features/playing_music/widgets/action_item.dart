import 'package:flutter/material.dart';

import '../../../core/components/custom_text_box.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(height: 2),
        CustomTextBox(title: label, color: Colors.white, size: 8),
      ],
    );
  }
}
