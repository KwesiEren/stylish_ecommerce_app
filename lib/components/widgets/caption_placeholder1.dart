import 'package:flutter/material.dart';

import '../constant/text_styles.dart';

class CaptionPlaceholder1 extends StatelessWidget {
  final String imageURL;
  final String heading1;
  final String heading2;

  const CaptionPlaceholder1(
      {super.key,
      this.imageURL = '',
      required this.heading1,
      required this.heading2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            image: imageURL.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(imageURL),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: imageURL.isEmpty
              ? const Icon(Icons.image, size: 60, color: Colors.grey)
              : null,
        ),
        Column(
          children: [
            Text(
              heading1,
              style: ktitle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              heading2,
              style: kheading3,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
