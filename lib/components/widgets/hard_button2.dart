import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';

class HardButton2 extends StatefulWidget {
  final String text;
  final Color? onClick_color;
  final IconData icon;
  final VoidCallback onPressed;

  HardButton2(
      {super.key,
      required this.text,
      this.onClick_color,
      required this.icon,
      required this.onPressed});

  @override
  State<HardButton2> createState() => _HardButton2State();
}

class _HardButton2State extends State<HardButton2> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        isClicked ? widget.onClick_color ?? buton_color1 : Colors.transparent;
    Color buttonColor1 = isClicked ? buton_color1 : base_color;
    Color buttonColor2 = isClicked ? base_color : base_color;
    TextStyle buttonStyle = isClicked ? kbutton2 : kbutton2;

    return GestureDetector(
      onTap: widget.onPressed,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: 120,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: buttonColor1, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: buttonStyle,
                ),
                Icon(
                  widget.icon,
                  color: buttonColor2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
