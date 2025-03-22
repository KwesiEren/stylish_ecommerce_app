import 'package:flutter/material.dart';

import '../constant/colour_scheme.dart';
import '../constant/text_styles.dart';

class HardButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final double? width;

  const HardButton1(
      {super.key, required this.text, required this.onPressed, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 250,
        decoration: BoxDecoration(
            color: buton_color2, borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: kbutton1,
          ),
        ),
      ),
    );
  }
}
