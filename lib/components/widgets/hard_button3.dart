import '../constant/text_styles.dart';
import 'package:flutter/material.dart';

class HardButton3 extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color? buttonColor;
  final VoidCallback onPressed;

  HardButton3(
      {super.key,
      required this.text,
      this.buttonColor,
      required this.icon,
      required this.onPressed});
  @override
  State<HardButton3> createState() => _HardButton3State();
}

class _HardButton3State extends State<HardButton3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(140, 158, 158, 158)),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Icon(
              widget.icon,
              color: widget.buttonColor ?? Colors.black,
            ),
            Text(
              widget.text,
              style: ktext4,
            ),
          ],
        ),
      ),
    );
  }
}
