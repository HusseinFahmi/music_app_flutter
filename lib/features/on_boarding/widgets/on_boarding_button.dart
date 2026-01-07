import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key, required this.onTap, required this.text});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 171,
        height: 60,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white, width: 2)),
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff2f5d9a), Color(0xff80cff2)],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
