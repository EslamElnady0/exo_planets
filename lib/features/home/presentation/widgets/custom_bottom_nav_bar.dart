import 'package:flutter/material.dart';

import 'bottom_nav_bar_clipper.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavBar({required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomNavBarClipper(), // Use custom shape for the nav bar
      child: BottomAppBar(
        color: Color(0xFF2E2E2E), // Dark background color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.language, 'Planets', 1),
            SizedBox(width: 48), // Spacer for the middle floating button
            _buildNavItem(Icons.quiz, 'Quiz', 2),
            _buildNavItem(Icons.settings, 'Settings', 3),
          ],
        ),
      ),
    );
  }

  // Helper to build navigation items
  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.red : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
