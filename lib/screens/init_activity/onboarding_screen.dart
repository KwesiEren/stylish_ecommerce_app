import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';
import 'package:stylish_ecommerce_app/components/widgets/caption_placeholder1.dart';
import 'package:stylish_ecommerce_app/screens/sketch.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track current page

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Sketch()),
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: base_color,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_currentPage + 1}/3',
                    style: ktext4,
                  ),
                  InkWell(
                    onTap: () {
                      _pageController.jumpToPage(2); // Skip to last page
                    },
                    child: Text(
                      'Skip',
                      style: ktext4.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),

            // PageView for onboarding screens
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index; // Update current page
                  });
                },
                children: [
                  CaptionPlaceholder1(
                    imageURL: 'assets/images/onb_1.png',
                    heading1: 'Choose Products',
                    heading2:
                        'Easily select from a wide range of quality products at the best prices.',
                  ),
                  CaptionPlaceholder1(
                    imageURL: 'assets/images/onb_2.png',
                    heading1: 'Add to Cart',
                    heading2:
                        'Simply add your favorite products to the cart for an easy checkout experience.',
                  ),
                  CaptionPlaceholder1(
                    imageURL: 'assets/images/onb_3.png',
                    heading1: 'Fast Delivery',
                    heading2:
                        'Get your products delivered quickly and securely to your doorstep.',
                  ),
                ],
              ),
            ),

            // Navigation Controls
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: _prevPage,
                    child: Text(
                      'Prev',
                      style: _currentPage > 0
                          ? ktext4
                          : ktext4.copyWith(color: Colors.grey),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3, // Number of pages
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  InkWell(
                    onTap: _nextPage,
                    child: Text(
                      _currentPage < 2 ? 'Next' : 'Get Started',
                      style: kbutton3.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
