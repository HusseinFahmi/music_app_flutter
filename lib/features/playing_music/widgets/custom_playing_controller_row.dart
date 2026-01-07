import 'package:flutter/material.dart';

import 'custom_skip_icon_container.dart';
import 'custom_slider_contril.dart';

class CustomPlayingControllerRow extends StatelessWidget {
  const CustomPlayingControllerRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final void Function(double) onChanged;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 25, top: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.shuffle, size: 30, color: Colors.white),

              CustomSkipIconContainer(icon: Icons.skip_previous_outlined),

              Container(
                height: 61,
                width: 61,
                decoration: BoxDecoration(
                  color: Color(0xffB1AFE9),

                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.pause, size: 40, color: Colors.white),
              ),

              CustomSkipIconContainer(icon: Icons.skip_next_outlined),

              Icon(Icons.repeat, size: 30, color: Colors.white),
            ],
          ),
        ),

        SizedBox(height: 35),

        CustomSliderControl(value: value, onChanged: onChanged),
      ],
    );
  }
}
