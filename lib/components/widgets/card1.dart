import 'ratings_tray.dart';
import '../constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/colour_scheme.dart';
import '../../provider/wishlist_provider.dart';

class ProductCard extends StatelessWidget {
  final String productid;
  final String productName;
  final String productDetails;
  final double price;
  final double rating;
  final String imageUrl; // Optional: You can use an image URL

  const ProductCard({
    super.key,
    required this.productid,
    required this.productName,
    required this.productDetails,
    required this.price,
    required this.rating,
    this.imageUrl = '', // Default empty string if no image is provided
  });

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final isInWishList = wishlistProvider.isInWishList(productid);
    return Column(
      children: [
        Container(
          width: 150,
          height: 245,
          decoration: BoxDecoration(
            color: card_color2,
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
              Stack(
                children: [
                  Container(
                    width: 190,
                    height: 118,
                    decoration: BoxDecoration(
                      color: card_color2,
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
                  Positioned(
                      child: IconButton(
                          onPressed: () {
                            if (isInWishList) {
                              wishlistProvider.remove(productid);
                            } else {
                              wishlistProvider.add(productid);
                            }
                          },
                          icon: Icon(
                            isInWishList
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isInWishList ? buton_color2 : text_color2,
                          )))
                ],
              ),

              // Product Info
              Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName, style: kheading4),
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
        ),
        SizedBox(
          height: 0.5,
        )
      ],
    );
  }
}
