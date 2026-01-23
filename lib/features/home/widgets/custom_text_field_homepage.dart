import 'package:flutter/material.dart';
import 'package:music_app/core/resources/color_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
import 'package:music_app/core/resources/strings_manager.dart';

class CustomTextFieldHomepage extends StatelessWidget {
  CustomTextFieldHomepage({
    super.key,
    required this.isSearchEnabled,
    required this.onTapSearchClose,
    required this.controller,
  });

  final transparentBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(SizeManager.s50),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  final void Function()? onTapSearchClose;
  final bool isSearchEnabled;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: StringsManager.searchSong,

        contentPadding: EdgeInsets.symmetric(horizontal: SizeManager.s15),
        hintStyle: const TextStyle(
          fontSize: SizeManager.s12,
          fontWeight: FontWeight.w400,
          color: ColorManager.white,
        ),

        suffixIcon: isSearchEnabled ? InkWell(onTap: onTapSearchClose,
                child: Icon(Icons.cancel_outlined, color: ColorManager.white),
              )
            : Icon(Icons.cancel_outlined, color: Colors.transparent,),

        prefixIcon: const Padding(adding: EdgeInsets.only(
            left: SizeManager.s20,
            right: SizeManager.s10,
          ),
          child: Icon(Icons.search, color: ColorManager.white),
        ),
        fillColor: ColorManager.secondaryColor,
        filled: true,

        border: transparentBorder,
        enabledBorder: transparentBorder,
        focusedBorder: transparentBorder,
      ),
    );
  }
}
