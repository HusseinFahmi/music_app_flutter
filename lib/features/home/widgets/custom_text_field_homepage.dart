import 'package:flutter/material.dart';

class CustomTextFieldHomepage extends StatelessWidget {
  CustomTextFieldHomepage({
    super.key,
    required this.isSearchEnabled,
    required this.onTapSearchClose,
    required this.controller,
  })final transparentBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
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
        hintText: "Search Song",

        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),

        suffixIcon: isSearchEnabled ? InkWell(onTap: onTapSearchClose,
            child: Icon(Icons.cancel_outlined, color: Colors.white,)) : Icon(
          Icons.cancel_outlined, color: Colors.transparent,),

        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 20.0, right: 10),
          child: Icon(Icons.search, color: Colors.white),
        ),
        fillColor: Color(0xffB1AFE9),
        filled: true,

        border: transparentBorder,
        enabledBorder: transparentBorder,
        focusedBorder: transparentBorder,
      ),
    );
  }
}
