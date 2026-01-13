import 'package:flutter/material.dart';

import '../../../core/components/custom_text_box.dart';

class CustomSliderControl extends StatelessWidget {
  const CustomSliderControl({
    super.key,
    required this.sliderPosition,
    required this.onChanged,
    required this.musicDuration,
    required this.musicPosition,
  });

  final Stream<double> sliderPosition;
  final void Function(double) onChanged;
  final Stream<String>musicDuration;
  final Stream<String> musicPosition;

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
            StreamBuilder<double>(
                initialData: 0.0,
                stream: sliderPosition,
                builder: (context, snap) {
                  return Slider(
                    min: 0,
                    max: 1,
                    value: snap.data!,
                    onChanged: onChanged,
                    activeColor: const Color(0xffB1AFE9),
                    inactiveColor: const Color(0xff2F5D9A),
                  );
                }
            ),
            const SizedBox(height: 9),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder<String>(
                  initialData: "00:00",
                  stream: musicPosition,
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

                StreamBuilder(
                    stream: musicDuration,
                    initialData: "00:00",
                    builder: (context, snap) {
                      final text = snap.data ?? "00:00";
                      return Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerRight,
                          child: CustomTextBox(
                            title: text,
                            color: const Color(0xffB1AFE9),
                            size: 12,
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
