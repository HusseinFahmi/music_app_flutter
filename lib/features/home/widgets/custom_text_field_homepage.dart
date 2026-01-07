import 'package:flutter/material.dart';

class CustomTextFieldHomepage extends StatelessWidget {
  CustomTextFieldHomepage({super.key});

  final transparentBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search Song",

        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10),
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
