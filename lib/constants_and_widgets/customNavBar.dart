import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  CustomNavigationBar(
      {required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('assets/images/Home.png', 0),
          _buildNavItem('assets/images/Cart.png', 1),
          _buildNavItem('assets/images/Like.png', 2),
          _buildNavItem('assets/images/User.png', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String imagePath, int index) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Image.asset(
          imagePath,
          width: 24,
          height: 24,
          color: currentIndex == index ? Colors.teal : Colors.grey,
        ),
      ),
    );
  }
}
