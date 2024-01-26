import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String childText;
  final double width;

  const MyButton({super.key, required this.onTap, required this.childText, required this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Text(
        childText,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      height: 55,
      minWidth: width,
      color: AppColor.buttonColor,
      padding: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
