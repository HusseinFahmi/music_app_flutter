import 'package:flutter/material.dart';
import 'package:music_app/core/resources/padding_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';

class CategoryTextBox extends StatelessWidget {
  const CategoryTextBox({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.categoryTextBoxPadding,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeManager.s18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
