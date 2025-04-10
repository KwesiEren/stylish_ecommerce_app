import 'package:flutter/material.dart';
import 'circlecard_widget2.dart';

class FeatureSection extends StatefulWidget {
  final List items;
  final String section;
  final String section2;
  final VoidCallback onPressed;

  FeatureSection(
      {super.key,
      required this.items,
      required this.section,
      required this.section2,
      required this.onPressed});

  @override
  State<FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<FeatureSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Monserrat',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 320,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.items[index];
                return Padding(
                  padding: const EdgeInsets.all(3),
                  child: CircleCard2(
                    imgUrl: item[widget.section2],
                    text: item[widget.section],
                    onPressed: widget.onPressed,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
