import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String childText;
  final double width;

  const MyButton({super.key, required this.onTap, required this.childText, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width:width,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColor.buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            childText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}