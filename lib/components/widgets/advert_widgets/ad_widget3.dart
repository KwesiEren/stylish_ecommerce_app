import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';

import '../../constant/text_styles.dart';
import '../hard_button2.dart';

class AdWidget3 extends StatelessWidget {
  final String button_text;
  final String text1;
  final String text2;
  final String imageUrl; // Optional: You can use an image URL
  final IconData text_icon;
  final IconData icon;
  final VoidCallback onPressed;
  AdWidget3(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon,
      this.imageUrl = '',
      required this.text_icon,
      required this.onPressed,
      required this.button_text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 280,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Product Image
          Container(
            width: 330,
            height: 200,
            decoration: BoxDecoration(
              color: card_color,
              borderRadius: BorderRadius.circular(10),
              image: imageUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl.isEmpty
                ? const Icon(Icons.image, size: 40, color: Colors.grey)
                : null,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: ktext2,
                    ),
                    Text(
                      text2,
                      style: ktext3,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: HardButton2(
                    onClick_color: buton_color1,
                    text: button_text,
                    icon: icon,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
