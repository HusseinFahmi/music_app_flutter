import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';

class GradientManager {
  static const mainBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [ColorManager.backgroundMid, ColorManager.backgroundDark],
    stops: [0.0, 0.54],
  );
}
