import 'package:flutter/material.dart';

import '../constant/colour_scheme.dart';

class CirclecardWidget extends StatefulWidget {
  final String imageUrl;
  final VoidCallback onPressed;

  const CirclecardWidget(
      {super.key, this.imageUrl = '', required this.onPressed});

  @override
  State<CirclecardWidget> createState() => _CirclecardWidgetState();
}

class _CirclecardWidgetState extends State<CirclecardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(19, 255, 129, 152),
          border: Border.all(color: buton_color2, width: 1),
        ),
        child: widget.imageUrl.isEmpty
            ? const Icon(Icons.image, color: Colors.grey)
            : Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
      ),
    );
  }
}
