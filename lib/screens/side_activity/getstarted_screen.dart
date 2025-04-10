import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';
import 'package:stylish_ecommerce_app/screens/skeleton.dart';

import '../../components/widgets/hard_button1.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  void _nextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
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
        backgroundColor: base_color,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg1.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.transparent,
              const Color.fromARGB(212, 0, 0, 0)
            ], begin: Alignment.center, end: Alignment.bottomCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // **Title**
                Text(
                  'You want\nAuthentic, here\nyou go!',
                  style: kheading1alt,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.01), // Dynamic spacing
                // **Title**
                Text(
                  'Find it here, buy it now',
                  style: ktext5,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.04), // Dynamic spacing
                HardButton1(
                  width: width * 0.70, // 85% of screen width
                  text: 'Get Started',
                  onPressed: () {
                    _nextPage();
                  },
                ),
                SizedBox(height: height * 0.02), // Dynamic spacing
              ],
            ),
          ),
        ),
      ),
    );
  }
}
