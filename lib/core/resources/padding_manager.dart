import 'package:flutter/material.dart';
import 'package:music_app/core/resources/size_manager.dart';

class PaddingManager {
  static const homeSearchPadding = EdgeInsets.only(
    top: SizeManager.s41,
    left: SizeManager.s41,
    right: SizeManager.s31,
    bottom: SizeManager.s15,
  );

  static const categoryTextBoxPadding = EdgeInsets.only(
    left: SizeManager.s50,
    right: SizeManager.s58,
    top: SizeManager.s15,
  );
}
