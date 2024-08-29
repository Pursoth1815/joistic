import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the white background
    Paint paintFill = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Path for the custom shape
    Path path = Path();

    // Start at the bottom left
    path.moveTo(0, size.height);

    // Bottom-left corner to the start of the left side curve
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(0, size.height * 0.15, 15, size.height * 0.15);

    // Draw left side to the starting point of the first "U" shape
    path.lineTo(size.width * 0.25 - 50, size.height * 0.15);

    // Draw the top half-circle
    path.arcToPoint(
      Offset(size.width * 0.35 + 50, size.height * 0.15), // Adjusted endpoint to make it a top half
      radius: Radius.circular(35),
      clockwise: true, // Set to true for a top half-circle
    );

    // Top-right corner with a curve
    path.lineTo(size.width - 15, size.height * 0.15);
    path.quadraticBezierTo(size.width, size.height * 0.15, size.width, size.height * 0.2);

    // Right side down to the bottom-right corner
    path.lineTo(size.width, size.height);

    // Complete the path by closing it
    path.close();

    // Draw the path with the white background
    canvas.drawPath(path, paintFill);

    // Optional: Add an inner arc with a different color or effect if needed
    // For now, the entire shape is white, including the arc
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
