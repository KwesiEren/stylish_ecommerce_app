import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/widgets/card1.dart';

class Sketch extends StatefulWidget {
  const Sketch({super.key});

  @override
  State<Sketch> createState() => _SketchState();
}

class _SketchState extends State<Sketch> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Shoes",
      "details": "Running Shoes",
      "price": 49.99,
      "rating": 4.5
    },
    {"name": "Watch", "details": "Smart Watch", "price": 99.99, "rating": 4.2},
    {
      "name": "Phone",
      "details": "Android Phone",
      "price": 699.99,
      "rating": 4.8
    },
    {
      "name": "Shoes",
      "details": "Running Shoes",
      "price": 49.99,
      "rating": 4.5
    },
    {"name": "Watch", "details": "Smart Watch", "price": 99.99, "rating": 4.2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sketch Screen'),
        backgroundColor: main_color,
      ),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 400,
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    productName: product["name"],
                    productDetails: product["details"],
                    price: product["price"],
                    rating: product["rating"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
