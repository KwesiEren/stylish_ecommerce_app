import 'package:flutter/material.dart';

import '../constant/colour_scheme.dart';

class LinkText1 extends StatelessWidget {
  final String text;
  final Widget target;
  final FontWeight thickness;
  final double? size;

  const LinkText1(
      {super.key,
      required this.text,
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
            color: buton_color2),
      ),
    );
  }
}
