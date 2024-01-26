import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;
  final TextInputType keyboardType; // keyboardType is now a required parameter

  const MyTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
    required this.suffixIcon,
    required this.keyboardType, // Marked as required and removed the default value
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType, // Use the required keyboardType here
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textFieldBlue),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
