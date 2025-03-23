import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/widgets/caption_placeholder1.dart';
import 'package:stylish_ecommerce_app/components/widgets/card1.dart';
import 'package:stylish_ecommerce_app/components/widgets/circlecard_widget.dart';
import 'package:stylish_ecommerce_app/components/widgets/hard_button1.dart';
import 'package:stylish_ecommerce_app/components/widgets/hyperlint_text.dart';
import 'package:stylish_ecommerce_app/components/widgets/inputfield&icon_widget.dart';
import 'package:stylish_ecommerce_app/components/widgets/size_variation_widget/size_section.dart';
import 'package:stylish_ecommerce_app/screens/init_activity/onboarding_screen.dart';

class Sketch extends StatefulWidget {
  const Sketch({super.key});

  @override
  State<Sketch> createState() => _SketchState();
}

class _SketchState extends State<Sketch> {
  bool _hidePassword = true;
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
                CirclecardWidget(),
                CirclecardWidget(),
                CirclecardWidget(),
              ],
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
