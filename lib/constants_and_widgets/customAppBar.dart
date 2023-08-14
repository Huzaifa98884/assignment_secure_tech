import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final TextStyle titleTextStyle;
  final double bottomRadius;

  CustomAppBar({
    required this.backgroundColor,
    required this.title,
    required this.titleTextStyle,
    this.bottomRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomRadius),
        bottomRight: Radius.circular(bottomRadius),
      ),
      child: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          title,
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
