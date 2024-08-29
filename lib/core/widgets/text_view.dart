import 'package:flutter/material.dart';
import 'package:joistic/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color hintColor;
  final Color textColor;
  final TextEditingController? controller;
  final Function(String)? onTextChanged;
  final String hintText;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final BoxShadow? boxShadow;
  final Color boxShadowColor;
  final bool isPasswordField;

  const CustomTextField({
    Key? key,
    this.width = double.infinity,
    this.height = 40,
    this.borderRadius = 15.0,
    this.backgroundColor = Colors.white,
    this.hintColor = Colors.black54,
    this.textColor = AppColors.blackLite,
    this.controller,
    this.onTextChanged,
    this.hintText = 'Search...',
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.textStyle,
    this.hintStyle,
    this.boxShadow,
    this.boxShadowColor = Colors.black,
    this.isPasswordField = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: [
          BoxShadow(
            color: widget.boxShadowColor.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {
          if (widget.onTextChanged != null) {
            widget.onTextChanged!(value);
          }
        },
        style: widget.textStyle ?? TextStyle(fontSize: 14, color: widget.textColor.withOpacity(0.8)),
        obscureText: widget.isPasswordField ? _obscureText : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          hintStyle: widget.hintStyle ?? TextStyle(fontSize: 14, color: widget.hintColor.withOpacity(0.5)),
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  splashColor: AppColors.transparent,
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: widget.textColor.withOpacity(0.5),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
