import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';

class SizeButton extends StatefulWidget {
  final String text;
  final Function(String) onSelect;

  SizeButton({super.key, required this.text, required this.onSelect});

  @override
  State<SizeButton> createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isClicked ? buton_color1 : base_color;
    TextStyle buttonStyle = isClicked ? kbutton2 : kbutton3;

    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
        if (isClicked) {
          widget.onSelect(widget.text);
        } else {
          widget.onSelect('N/A');
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 60,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: buton_color1, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.text,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}
