import 'package:flutter/material.dart';
import 'package:joistic/core/constants/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double fontSize;
  final Future<void> Function() onPressed;
  final double width;
  final double height;
  final double letterSpacing;
  final Color color;
  final Color textColor;
  final Color shadowColor;
  final double borderRadius;
  final Widget? icon;
  final EdgeInsetsGeometry iconPadding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.fontSize = 14,
    this.height = 50,
    this.letterSpacing = 1,
    this.color = AppColors.purple,
    this.shadowColor = AppColors.white,
    this.textColor = Colors.white,
    this.borderRadius = 30,
    this.icon,
    this.iconPadding = const EdgeInsets.only(right: 8),
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  Future<void> _handlePress() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handlePress,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: _isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: widget.textColor,
                    strokeWidth: 3,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null)
                      Padding(
                        padding: widget.iconPadding,
                        child: widget.icon!,
                      ),
                    Text(
                      widget.text,
                      style: TextStyle(
                        letterSpacing: widget.letterSpacing,
                        color: widget.textColor,
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
