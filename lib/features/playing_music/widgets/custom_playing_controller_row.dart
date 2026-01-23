import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';

import 'custom_skip_icon_container.dart';
import 'custom_slider_control.dart';

class CustomPlayingControllerRow extends StatelessWidget {
  const CustomPlayingControllerRow({
    super.key,
    required this.value,
    required this.onChangeEnd,
    required this.onTapRandomMusic,
    required this.isRandomEnabled,
    required this.onTapPrevNext,
    required this.onTapPauseButton,
    required this.isPlaying,
    required this.onTapLoop,
    required this.isRepeatEnabled,
    required this.onTapSkipNext,
    required this.sliderPosition,
    required this.musicPosition,
    required this.musicDuration,
  });

  final void Function(double)? onChangeEnd;
  final double value;

  final void Function() onTapRandomMusic;
  final void Function() onTapPauseButton;
  final void Function() onTapSkipNext;
  final void Function() onTapPrevNext;
  final void Function() onTapLoop;

  final bool isPlaying;
  final bool isRepeatEnabled;
  final bool isRandomEnabled;
  final Stream<double> sliderPosition;
  final Stream<String> musicPosition;
  final Stream<String> musicDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: SizeManager.s30,
              right: SizeManager.s25,
              top: SizeManager.s28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onTapRandomMusic,
                child: Icon(Icons.shuffle, size: SizeManager.s30,
                    color: isRandomEnabled ? ColorManager.blue : ColorManager
                        .white),
              ),

              InkWell(
                onTap: onTapPrevNext,
                child: const CustomSkipIconContainer(
                  icon: Icons.skip_previous_outlined,
                ),
              ),

              InkWell(
                onTap: onTapPauseButton,
                child: Container(
                  height: SizeManager.s61,
                  width: SizeManager.s61,
                  decoration: BoxDecoration(
                    color: ColorManager.secondaryColor,
                    borderRadius: BorderRadius.circular(SizeManager.s30),
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: SizeManager.s40,
                    color: ColorManager.white,
                  ),
                ),
              ),

              InkWell(
                onTap: onTapSkipNext,
                child: const CustomSkipIconContainer(
                  icon: Icons.skip_next_outlined,
                ),
              ),

              InkWell(
                onTap: onTapLoop,
                child: Icon(
                  Icons.repeat,
                  size: SizeManager.s30,
                  color: isRepeatEnabled ? ColorManager.blue : ColorManager
                      .white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: SizeManager.s35),

        CustomSliderControl(
          sliderPosition: sliderPosition,
          onChangeEnd: onChangeEnd,
          musicDuration: musicDuration,
          musicPosition: musicPosition,
        ),
      ],
    );
  }
}
