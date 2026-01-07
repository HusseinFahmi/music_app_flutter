import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    required this.title,
    required this.color,
    required this.size,
  });

  final String title;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
