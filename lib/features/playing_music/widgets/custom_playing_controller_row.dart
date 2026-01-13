import 'package:flutter/material.dart';

import 'custom_skip_icon_container.dart';
import 'custom_slider_control.dart';

class CustomPlayingControllerRow extends StatelessWidget {
  const CustomPlayingControllerRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onTapPrevNext,
    required this.onTapPauseButton,
    required this.isPlaying,
    required this.onTapSkipNext,
    required this.sliderPosition,
    required this.musicPosition,
    required this.musicDuration,
  });

  final void Function(double) onChanged;
  final double value;

  final void Function() onTapPauseButton;
  final void Function() onTapSkipNext;
  final void Function() onTapPrevNext;

  final bool isPlaying;
  final Stream<double> sliderPosition;
  final Stream<String> musicPosition;
  final Stream<String> musicDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 25, top: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.shuffle, size: 30, color: Colors.white),

              InkWell(
                  onTap: onTapPrevNext,
                  child: const CustomSkipIconContainer(
                      icon: Icons.skip_previous_outlined)
              ),

              InkWell(
                onTap: onTapPauseButton,
                child: Container(
                  height: 61,
                  width: 61,
                  decoration: BoxDecoration(
                    color: const Color(0xffB1AFE9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),

              InkWell(
                onTap: onTapSkipNext,
                child: const CustomSkipIconContainer(
                  icon: Icons.skip_next_outlined,
                ),
              ),

              const Icon(Icons.repeat, size: 30, color: Colors.white),
            ],
          ),
        ),
        const SizedBox(height: 35),

        CustomSliderControl(
          sliderPosition: sliderPosition,
          onChanged: onChanged,
          musicDuration: musicDuration,
          musicPosition: musicPosition,
        ),
      ],
    );
  }
}
