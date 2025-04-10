import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/widgets/appbar_widget/appbar_widget.dart';
import 'package:stylish_ecommerce_app/screens/sketch.dart';

import '../../components/widgets/card1.dart';
import '../../components/widgets/featured_product_widget/featured_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> products = [
    {
      "name": "Shoes",
      "image": "assets/images/onb_1.png",
      "details": "Running Shoes",
      "price": 49.99,
      "rating": 3.5
    },
    {
      "name": "Watch",
      "image": "assets/images/onb_1.png",
      "details": "Smart Watch",
      "price": 99.99,
      "rating": 2.2
    },
    {
      "name": "Phone",
      "image": "assets/images/onb_1.png",
      "details": "Android Phone",
      "price": 699.99,
      "rating": 4.8
    },
    {
      "name": "Shoes",
      "image": "assets/images/onb_1.png",
      "details": "Running Shoes",
      "price": 49.99,
      "rating": 1.5
    },
    {
      "name": "Watch",
      "image": "assets/images/onb_1.png",
      "details": "Smart Watch",
      "price": 99.99,
      "rating": 4.2
    },
  ];

  void _nextPage(Widget target) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => target),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double height = screen.height;
    final double width = screen.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 170,
          searchController: _searchController,
          onSearchChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
          onMapPressed: () {
            _nextPage(Sketch());
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                FeatureSection(
                  items: products,
                  section: 'name',
                  section2: 'image',
                  onPressed: () {},
                ),
                SizedBox(
                  width: width * 0.95,
                  height: height * 0.70,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
        ),
      ),
    );
  }
}
