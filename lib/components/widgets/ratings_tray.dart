import 'package:flutter/material.dart';

class RatingsTray extends StatelessWidget {
  final double rating;

  const RatingsTray({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star, size: 15, color: Colors.yellow);
        } else if (index < rating) {
          return const Icon(Icons.star_half, size: 15, color: Colors.yellow);
        } else {
          return const Icon(Icons.star_border, size: 15, color: Colors.grey);
        }
      }),
    );
  }
}
