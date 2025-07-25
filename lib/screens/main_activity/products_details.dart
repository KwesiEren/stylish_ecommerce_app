import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';
import 'package:stylish_ecommerce_app/components/widgets/hard_button3.dart';
import 'package:stylish_ecommerce_app/components/widgets/ratings_tray.dart';
import 'package:stylish_ecommerce_app/components/widgets/size_variation_widget/size_section.dart';

class ProductDetailScreen extends StatefulWidget {
  final String product_image;
  final String product_name;
  final String? product_description;
  final double? product_rating;
  final double product_price;
  final String? product_details;
  const ProductDetailScreen(
      {super.key,
      required this.product_image,
      required this.product_name,
      required this.product_rating,
      required this.product_description,
      required this.product_details,
      required this.product_price});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<Map<String, dynamic>> sizes = [
    {"size1": "S", "size2": 35},
    {"size1": "M", "size2": 44},
    {"size1": "L", "size2": 45},
    {"size1": "XL", "size2": 48},
    {"size1": "XXL", "size2": 50},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(121, 216, 216, 216),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product_image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 350,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizeSection(items: sizes, section: 'size1'),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.product_name}',
                        style: kheading4,
                      ),
                      Text('${widget.product_description}'),
                      RatingsTray(rating: widget.product_rating ?? 1),
                      Text(
                        '\$${widget.product_price}',
                        style: ktext4,
                      ),
                      Text(
                        'Product Details',
                        style: ktext6,
                      ),
                      SizedBox(
                        child: Text(
                          '${widget.product_details}',
                          style: ktext7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 10,
              children: [
                HardButton3(
                  text: 'View Similar',
                  icon: Icons.visibility,
                  onPressed: () {},
                ),
                HardButton3(
                  text: 'Add to Cart',
                  icon: Icons.add_shopping_cart,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
