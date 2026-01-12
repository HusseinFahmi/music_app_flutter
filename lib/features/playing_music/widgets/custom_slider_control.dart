import 'package:flutter/material.dart';

import '../../../core/components/custom_text_box.dart';

class CustomSliderControl extends StatelessWidget {
  const CustomSliderControl({
    super.key,
    required this.value,
    required this.onChanged,
    required this.songDuration,
    required this.musicPosition,
  });

  final double value;
  final void Function(double) onChanged;
  final String songDuration;
  final Stream<String> musicPosition;

  @override
  Widget build(BuildContext context) {
    final safeValue = value.clamp(0.0, 1.0);

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
              min: 0,
              max: 1,
              value: safeValue,
              onChanged: onChanged,
              activeColor: const Color(0xffB1AFE9),
              inactiveColor: const Color(0xff2F5D9A),
            ),
            const SizedBox(height: 9),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // current position
                StreamBuilder<String>(
                  stream: musicPosition,
                  initialData: "00:00",
                  builder: (context, snapshot) {
                    final text = snapshot.data ?? "00:00";
                    return Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: CustomTextBox(
                          title: text,
                          color: const Color(0xffB1AFE9),
                          size: 12,
                        ),
                      ),
                    );
                  },
                ),

                // duration
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: CustomTextBox(
                      title: songDuration,
                      color: const Color(0xffB1AFE9),
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
