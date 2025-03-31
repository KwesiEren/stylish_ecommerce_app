import 'package:flutter/material.dart';

import '../../constant/text_styles.dart';
import '../hard_button2.dart';

class AdWidget4 extends StatelessWidget {
  final String button_text;
  final String text1;
  final String text2;
  final String bg_img;
  final IconData icon;
  final VoidCallback onPressed;
  AdWidget4(
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
      height: 250,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 145,
            height: 245,
            child: Image.network(
              bg_img,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 180,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
          ),
        ],
      ),
    );
  }
}
