import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';

class CircleCard2 extends StatefulWidget {
  final String text;
  final String imgUrl;
  final VoidCallback onPressed;

  CircleCard2(
      {super.key,
      required this.text,
      this.imgUrl = '',
      required this.onPressed});

  @override
  State<CircleCard2> createState() => _CircleCard2State();
}

class _CircleCard2State extends State<CircleCard2> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isClicked ? buton_color1 : base_color;
    TextStyle buttonStyle = isClicked ? kbutton3 : ktext4;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(19, 255, 129, 152),
              border: Border.all(color: buton_color2, width: 1),
            ),
            child: widget.imgUrl.isEmpty
                ? const Icon(Icons.image, color: Colors.grey)
                : Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      widget.imgUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.text,
              style: buttonStyle,
            ),
          ),
        ],
      ),
    );
  }
}
