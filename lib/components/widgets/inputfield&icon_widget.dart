import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';

import 'validation_logic.dart';

class InputField1 extends StatelessWidget {
  InputField1({
    required this.hint,
    required this.icon,
    this.controller,
    this.hideText,
    this.suffixIcon,
    super.key,
    this.callback,
  });

  final String hint;
  final IconData icon;
  final TextEditingController? controller;
  final bool? hideText;
  final IconData? suffixIcon;
  final VoidCallback? callback;

  final valid = ValidationClass();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: hideText ?? false,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusColor: buton_color1,
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 77, 77, 77),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Overpass',
          color: text_color2,
        ),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: callback, child: Icon(suffixIcon, color: Colors.grey))
            : null,
        filled: true,
        fillColor: const Color.fromARGB(63, 158, 158, 158),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color.fromARGB(150, 158, 158, 158),
            width: 1,
          ),
        ),
      ),
      validator: (value) {
        // This block below checks the type of input before validation;
        if (hideText == true) {
          // Validate password if hideText is true
          return valid.validatePassword(value);
        } else {
          // Validate email if hideText is false
          return valid.validateEmail(value);
        }
        // Ends here
      },
    );
  }
}
