import 'package:flutter/material.dart';

import '../constant/colour_scheme.dart';
import '../constant/text_styles.dart';
import 'ratings_tray.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productDetails;
  final double price;
  final double rating;
  final String imageUrl; // Optional: You can use an image URL

  const ProductCard({
    super.key,
    required this.productName,
    required this.productDetails,
    required this.price,
    required this.rating,
    this.imageUrl = '', // Default empty string if no image is provided
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        color: main_color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(70, 0, 0, 0),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Product Image
          Container(
            width: 167,
            height: 130,
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

          // Product Info
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: kheading2),
                Text(
                  productDetails,
                  style: kheading3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('\$${price.toStringAsFixed(2)}', style: kheading2),

                // Rating Tray
                RatingsTray(rating: rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
