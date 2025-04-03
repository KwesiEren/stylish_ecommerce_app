import 'package:flutter/material.dart';

import '../constant/colour_scheme.dart';

class LinkText1 extends StatelessWidget {
  final String text;
  final TextDecoration? decoration;
  final Widget target;
  final Color? color;
  final FontWeight thickness;
  final double? size;

  const LinkText1(
      {super.key,
      required this.text,
      this.decoration,
      this.color,
      required this.thickness,
      required this.target,
      this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Target Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => target),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Monserrat',
          fontSize: size ?? 17,
          fontWeight: thickness,
          color: color ?? buton_color2,
          decoration: decoration ?? TextDecoration.none,
          decorationColor: buton_color2,
        ),
      ),
    );
  }
}
