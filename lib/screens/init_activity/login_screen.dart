import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';
import 'package:stylish_ecommerce_app/components/widgets/hyperlint_text.dart';
import 'package:stylish_ecommerce_app/screens/main_activity/home_screen.dart';

import '../../components/widgets/circlecard_widget.dart';
import '../../components/widgets/hard_button1.dart';
import '../../components/widgets/inputfield&icon_widget.dart';
import 'recover_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = true;

  void _nextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double height = screen.height;
    final double width = screen.width;

    return Scaffold(
      backgroundColor: base_color,
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.9, // 90% of screen height
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: height * 0.02), // Dynamic spacing

              // **Title**
              Text('Welcome\nBack!', style: ktitle),

              // **Input Fields**
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InputField1(icon: Icons.person, hint: 'Username or Email'),
                  SizedBox(height: height * 0.03),
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
                  SizedBox(height: height * 0.015),
                  LinkText1(
                    text: 'Forgot Password?',
                    thickness: FontWeight.w300,
                    target: RecoverScreen(),
                  ),
                ],
              ),

              // **Login Button**
              SizedBox(height: height * 0.02),
              HardButton1(
                width: width * 0.85, // 85% of screen width
                text: 'Login',
                onPressed: () {
                  _nextPage();
                },
              ),

              // **Social Login Section**
              SizedBox(height: height * 0.07),
              Container(
                alignment: Alignment.center,
                height: height * 0.2, // 20% of screen height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('- OR Continue with -', style: ktext4),

                    // **Social Icons**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CirclecardWidget(imageUrl: 'assets/images/google.png'),
                        SizedBox(width: width * 0.05),
                        CirclecardWidget(imageUrl: 'assets/images/apple.png'),
                        SizedBox(width: width * 0.05),
                        CirclecardWidget(imageUrl: 'assets/images/fb.png'),
                      ],
                    ),

                    // **Sign Up Option**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create An Account,', style: ktext4),
                        SizedBox(width: width * 0.02),
                        LinkText1(
                          text: 'Sign Up',
                          decoration: TextDecoration.underline,
                          thickness: FontWeight.w400,
                          target: RegisterScreen(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
