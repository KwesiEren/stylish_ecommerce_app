import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/screens/init_activity/login_screen.dart';

import '../../components/constant/colour_scheme.dart';
import '../../components/constant/text_styles.dart';
import '../../components/widgets/circlecard_widget.dart';
import '../../components/widgets/hard_button1.dart';
import '../../components/widgets/hyperlint_text.dart';
import '../../components/widgets/inputfield&icon_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double height = screen.height;
    final double width = screen.width;

    return Scaffold(
      backgroundColor: base_color,
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.95, // 95% of screen height
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: height * 0.04), // Dynamic spacing

              // **Title**
              Text('Create an\naccount', style: ktitle),
              SizedBox(height: height * 0.03), // Dynamic spacing

              // **Input Fields**
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: height * 0.04),
                  InputField1(
                    icon: Icons.lock,
                    hint: 'Confirm Password',
                    hideText: _hidePassword,
                    suffixIcon: Icons.visibility,
                    callback: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  RichText(
                    text: TextSpan(
                      text: 'By clicking the ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: buton_color2,
                          ),
                        ),
                        TextSpan(
                          text: ' button, you agree\nto the public offer.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
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
                text: 'Create Account',
                onPressed: () {},
              ),

              // **Social Login Section**
              SizedBox(height: height * 0.07),
              Container(
                alignment: Alignment.center,
                height: height * 0.17, // 20% of screen height
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
                        Text('I Already Have an Account,', style: ktext4),
                        SizedBox(width: width * 0.02),
                        LinkText1(
                          text: 'Login',
                          decoration: TextDecoration.underline,
                          thickness: FontWeight.w400,
                          target: LoginScreen(),
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
