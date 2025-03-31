import 'package:flutter/material.dart';

import '../../constant/text_styles.dart';
import '../hard_button2.dart';

class AdWidget1 extends StatelessWidget {
  final String button_text;
  final String text1;
  final String text2;
  final String bg_img;
  final IconData icon;
  final VoidCallback onPressed;
  AdWidget1(
      {super.key,
      required this.text1,
      required this.bg_img,
      required this.text2,
      required this.icon,
      required this.onPressed,
      required this.button_text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(bg_img),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              text1,
              style: kbutton1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text2,
              style: ktext1,
            ),
            SizedBox(
              height: 10,
            ),
            HardButton2(
              text: button_text,
              icon: icon,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
