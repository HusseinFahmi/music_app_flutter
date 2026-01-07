import 'package:flutter/material.dart';
import 'package:music_app/core/components/custom_text_box.dart';

class CustomSliderControl extends StatelessWidget {
  const CustomSliderControl({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Column(
          children: [
            Slider(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xffB1AFE9),
              inactiveColor: const Color(0xff2F5D9A),
            ),

            SizedBox(height: 9),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextBox(
                  title: '2.05',
                  color: Color(0xffB1AFE9),
                  size: 12,
                ),
                CustomTextBox(
                  title: '3:54',
                  color: Color(0xffB1AFE9),
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
