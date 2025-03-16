import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding Page 1'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'data',
              style: kheading1,
            ),
            Text(
              'data',
              style: kheading2,
            ),
            Text(
              'data',
              style: kheading3,
            ),
            SizedBox(
                width: 300,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: base_color,
                          child: Text('base'),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: main_color,
                          child: Text('base'),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: card_color,
                          child: Text('base'),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: text_color1,
                          child: Text('base'),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: text_color2,
                          child: Text('base'),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: text_color3,
                          child: Text('base'),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: buton_color1,
                          child: Text('base'),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: buton_color2,
                          child: Text('base'),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
