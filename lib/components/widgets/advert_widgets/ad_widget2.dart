import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';

import '../../constant/text_styles.dart';
import '../hard_button2.dart';

class AdWidget2 extends StatelessWidget {
  final String button_text;
  final String text1;
  final String text2;
  final IconData text_icon;
  final IconData icon;
  final VoidCallback onPressed;
  AdWidget2(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon,
      required this.text_icon,
      required this.onPressed,
      required this.button_text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
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
                Row(
                  children: [
                    Icon(
                      text_icon,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      text2,
                      style: ktext3,
                    ),
                  ],
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
    );
  }
}
