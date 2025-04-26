import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/screens/init_activity/login_screen.dart';
import 'package:stylish_ecommerce_app/screens/side_activity/getstarted_screen.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../../components/constant/colour_scheme.dart';
import '../../components/constant/text_styles.dart';
import '../../components/widgets/circlecard_widget.dart';
import '../../components/widgets/hard_button1.dart';
import '../../components/widgets/hyperlint_text.dart';
import '../../components/widgets/inputfield&icon_widget.dart';
import '../../provider/api_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  final _passwordController = TextEditingController();

  String? _error;
  String? password1;
  String? password2;

  bool _loading = false;
  bool _hidePassword = true;

  void _nextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GetStartedScreen()),
    );
  }

  void _showToast(String msg) {
    showToast(msg, context: context);
  }

  void _register() async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    setState(() {
      _loading = true;
      _error = null;
    });

    final success = await apiProvider.register(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );

    if (success.containsKey('error')) {
      setState(() {
        _error = "Registration failed.";
        _loading = false;
      });
    } else {
      // Navigate to get-started screen
      _nextPage();
    }
  }

  void _checker() {
    // Allocate new Password
    setState(() {
      password1 = _password1Controller.text;
      password2 = _password2Controller.text;
    });
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (context) {
        return AlertDialog(
          backgroundColor: buton_color2,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: text_color4,
              ),
              SizedBox(height: 25),
              Text(
                "Creating Account",
                style: TextStyle(color: text_color4),
              ),
            ],
          ),
        );
      },
    );
    try {
      if (password1 == password2) {
        setState(() {
          password2 = _passwordController.text;
        });

        _register();
      } else {
        _showToast('Passwords don\'t match!');
      }

      // Close loading dialog
      Navigator.of(context).pop();
    } catch (e) {
      // Close loading dialog
      Navigator.of(context).pop();
      print(e);
    }
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
          height: height * 0.95, // 95% of screen height
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: height * 0.03), // Dynamic spacing

              // **Title**
              Text('Create an\naccount', style: ktitle),
              SizedBox(height: height * 0.03), // Dynamic spacing

              // **Input Fields**
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField1(
                    icon: Icons.person,
                    controller: _nameController,
                    hint: 'Username',
                  ),
                  SizedBox(height: height * 0.02),
                  InputField1(
                    icon: Icons.mail,
                    controller: _emailController,
                    hint: 'Email',
                  ),
                  SizedBox(height: height * 0.02),
                  InputField1(
                    icon: Icons.lock,
                    controller: _password1Controller,
                    hint: 'Password',
                    hideText: _hidePassword,
                    suffixIcon: Icons.visibility,
                    callback: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  InputField1(
                    icon: Icons.lock,
                    controller: _password2Controller,
                    hint: 'Confirm Password',
                    hideText: _hidePassword,
                    suffixIcon: Icons.visibility,
                    callback: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                  ),
                  SizedBox(height: height * 0.02),
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
              SizedBox(height: height * 0.03),
              HardButton1(
                width: width * 0.85, // 85% of screen width
                text: 'Create Account',
                onPressed: () {
                  // _nextPage();
                  _checker();
                },
              ),

              // **Social Login Section**
              SizedBox(height: height * 0.02),
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
                        CirclecardWidget(
                            onPressed: () {},
                            imageUrl: 'assets/images/google.png'),
                        SizedBox(width: width * 0.05),
                        CirclecardWidget(
                            onPressed: () {},
                            imageUrl: 'assets/images/apple.png'),
                        SizedBox(width: width * 0.05),
                        CirclecardWidget(
                            onPressed: () {}, imageUrl: 'assets/images/fb.png'),
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
