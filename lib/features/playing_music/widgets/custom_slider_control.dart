import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';

import '../../../core/components/custom_text_box.dart';

class CustomSliderControl extends StatelessWidget {
  const CustomSliderControl({
    super.key,
    required this.sliderPosition,
    required this.onChangeEnd,
    required this.musicDuration,
    required this.musicPosition,
  });

  final Stream<double> sliderPosition;
  final Stream<String>musicDuration;
  final Stream<String> musicPosition;
  final void Function(double)? onChangeEnd;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s26),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: SizeManager.s0),
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Column(
          children: [
            StreamBuilder<double>(
                initialData: 0.0,
                stream: sliderPosition,
                builder: (context, snap) {
                  return Slider(
                    min: SizeManager.s0,
                    max: SizeManager.s1,
                    value: snap.data!,
                    onChangeEnd: onChangeEnd,
                    onChanged: (value) {},
                    activeColor: ColorManager.secondaryColor,
                    inactiveColor: ColorManager.secondaryBlue,
                  );
                }
            ),
            const SizedBox(height: SizeManager.s9),

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
                          color: ColorManager.secondaryColor,
                          size: SizeManager.s12,
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
                            color: ColorManager.secondaryColor,
                            size: SizeManager.s12,
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
