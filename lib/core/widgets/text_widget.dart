import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final dynamic maxLines;
  final TextOverflow overflow;
  final TextStyle? style;

  const CustomText({
    Key? key,
    required this.text,
    this.size = 14.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.maxLines = null,
    this.overflow = TextOverflow.ellipsis,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style?.copyWith(
            fontSize: size,
            color: color,
            fontWeight: fontWeight,
          ) ??
          TextStyle(
            fontSize: size,
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }
}
