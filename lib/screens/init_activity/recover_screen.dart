import 'package:flutter/material.dart';

import '../../components/constant/colour_scheme.dart';
import '../../components/constant/text_styles.dart';
import '../../components/widgets/hard_button1.dart';
import '../../components/widgets/inputfield&icon_widget.dart';

class RecoverScreen extends StatefulWidget {
  const RecoverScreen({super.key});

  @override
  State<RecoverScreen> createState() => _RecoverScreenState();
}

class _RecoverScreenState extends State<RecoverScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double height = screen.height;
    final double width = screen.width;

    return Scaffold(
      backgroundColor: base_color,
      body: Container(
        height: height * 0.95, // 95% of screen height
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.06), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.05), // Dynamic spacing

            // **Title**
            Text('Forgot\npassword?', style: ktitle),
            SizedBox(height: height * 0.04), // Dynamic spacing

            // **Input Fields**
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField1(icon: Icons.mail, hint: 'Enter your email address'),
                SizedBox(height: height * 0.03),
                RichText(
                  text: TextSpan(
                    text: '* ',
                    style: TextStyle(
                      fontSize: 16,
                      color: buton_color2,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'We will send you a message to set or reset\nyour new password.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: text_color1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // **Login Button**
            SizedBox(height: height * 0.04),
            HardButton1(
              width: width * 0.85, // 85% of screen width
              text: 'Submit',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
