import 'package:flutter/material.dart';
import 'size_button.dart';

class SizeSection extends StatefulWidget {
  final List items;
  final String section;

  SizeSection({super.key, required this.items, required this.section});

  @override
  State<SizeSection> createState() => _SizeSectionState();
}

class _SizeSectionState extends State<SizeSection> {
  String selectedSize = 'N/A';

  void updateSelectedSize(String newSize) {
    setState(() {
      selectedSize = newSize; // Update the displayed size
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size: $selectedSize',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Monserrat',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.items[index];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizeButton(
                    text: item[widget.section],
                    onSelect: updateSelectedSize,
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
