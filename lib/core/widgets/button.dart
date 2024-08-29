import 'package:flutter/material.dart';
import 'package:joistic/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double letterSpacing;
  final Color color;
  final double borderRadius;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.fontSize = 14,
    this.height = 50,
    this.letterSpacing = 1,
    this.color = AppColors.purple,
    this.borderRadius = 30,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger the callback when tapped
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              letterSpacing: letterSpacing,
              color: Colors.white, // White text color
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
