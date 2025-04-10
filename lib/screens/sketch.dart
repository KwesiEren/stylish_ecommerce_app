import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/widgets/advert_widgets/ad_widget1.dart';
import 'package:stylish_ecommerce_app/components/widgets/advert_widgets/ad_widget3.dart';
import 'package:stylish_ecommerce_app/components/widgets/caption_placeholder1.dart';
import 'package:stylish_ecommerce_app/components/widgets/card1.dart';
import 'package:stylish_ecommerce_app/components/widgets/circlecard_widget.dart';
import 'package:stylish_ecommerce_app/components/widgets/featured_product_widget/featured_section.dart';
import 'package:stylish_ecommerce_app/components/widgets/hard_button1.dart';
import 'package:stylish_ecommerce_app/components/widgets/hyperlint_text.dart';
import 'package:stylish_ecommerce_app/components/widgets/inputfield&icon_widget.dart';
import 'package:stylish_ecommerce_app/components/widgets/size_variation_widget/size_section.dart';
import 'package:stylish_ecommerce_app/screens/init_activity/onboarding_screen.dart';

import '../components/widgets/advert_widgets/ad_widget2.dart';
import '../components/widgets/advert_widgets/ad_widget4.dart';
import '../components/widgets/appbar_widget/appbar_widget.dart';

class Sketch extends StatefulWidget {
  const Sketch({super.key});

  @override
  State<Sketch> createState() => _SketchState();
}

class _SketchState extends State<Sketch> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _hidePassword = true;
  final List<Map<String, dynamic>> products = [
    {
      "name": "Shoes",
      "image": "assets/images/onb_1.png",
      "details": "Running Shoes",
      "price": 49.99,
      "rating": 4.5
    },
    {
      "name": "Watch",
      "image": "assets/images/onb_1.png",
      "details": "Smart Watch",
      "price": 99.99,
      "rating": 4.2
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
      "rating": 4.5
    },
    {
      "name": "Watch",
      "image": "assets/images/onb_1.png",
      "details": "Smart Watch",
      "price": 99.99,
      "rating": 4.2
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sketch Screen'),
        backgroundColor: main_color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product List
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

            // Image and Text Placeholder,
            CaptionPlaceholder1(
              heading1: 'Data Sample',
              heading2:
                  'Data sampled from the depth of his bussom is not hard to dissercn but there is caution to the wind.',
            ),
            SizedBox(
              height: 20,
            ),
            LinkText1(
              text: 'Click Here',
              thickness: FontWeight.w300,
              target: OnboardingScreen(),
            ),
            SizedBox(
              height: 20,
            ),

            HardButton1(
              text: 'Button',
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),

            // SizeButton(
            //   text: '6 UK',
            // ),
            SizedBox(
              height: 20,
            ),
            SizeSection(
              items: products,
              section: 'name',
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  InputField1(
                    icon: Icons.person,
                    hint: 'Email',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField1(
                    icon: Icons.lock,
                    hint: 'Password',
                    hideText: _hidePassword,
                    suffixIcon: Icons.visibility,
                    callback: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                CirclecardWidget(
                  onPressed: () {},
                ),
                CirclecardWidget(
                  onPressed: () {},
                ),
                CirclecardWidget(
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AdWidget1(
              onPressed: () {},
              button_text: 'Shop Now',
              icon: Icons.arrow_forward,
              text1: '50% - 40% OFF',
              text2: 'New products in stock\nAll colors available',
              bg_img:
                  'https://get.wallhere.com/photo/women-model-portrait-dress-blue-pattern-fashion-spring-clothing-design-snapshot-textile-photo-shoot-abdomen-114810.jpg',
            ),
            SizedBox(
              height: 20,
            ),
            AdWidget2(
              onPressed: () {},
              button_text: 'View all',
              icon: Icons.arrow_forward,
              text1: 'Deal of the Day',
              text_icon: Icons.alarm,
              text2: 'Wanna See',
            ),
            SizedBox(
              height: 20,
            ),
            AdWidget3(
              onPressed: () {},
              button_text: 'View all',
              icon: Icons.arrow_forward,
              text1: 'New Arrivals',
              text2: 'Summer\'25 Collections',
            ),
            SizedBox(
              height: 20,
            ),
            AdWidget4(
              onPressed: () {},
              button_text: 'View Now',
              icon: Icons.arrow_forward,
              text1: '50% - 40% OFF',
              text2: 'New products in stock\nAll colors available',
              bg_img:
                  'https://get.wallhere.com/photo/women-model-portrait-dress-blue-pattern-fashion-spring-clothing-design-snapshot-textile-photo-shoot-abdomen-114810.jpg',
            ),
            SizedBox(
              height: 20,
            ),
            CustomAppBar(
              height: 85,
              searchController: _searchController,
              onSearchChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
              onMapPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            FeatureSection(
              items: products,
              section: 'name',
              section2: 'image',
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
