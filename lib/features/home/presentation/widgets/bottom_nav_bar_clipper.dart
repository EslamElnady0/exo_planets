import 'package:flutter/material.dart';

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double fabRadius = 25; // Radius for the floating action button

    path.lineTo(size.width * 0.35, 0); // Left curve start
    path.quadraticBezierTo(
      size.width * 0.40, 0,
      size.width * 0.45, fabRadius, // Left curve control point
    );
    path.arcToPoint(
      Offset(size.width * 0.55, fabRadius), // Arc for the FAB cut-out
      radius: Radius.circular(fabRadius),
      clockwise: false,
    );
    path.quadraticBezierTo(
      size.width * 0.60, 0,
      size.width * 0.65, 0, // Right curve control point
    );
    path.lineTo(size.width, 5); // Finish right side
    path.lineTo(size.width, size.height); // Go to bottom right
    path.lineTo(0, size.height); // Go to bottom left
    path.close(); // Complete the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
