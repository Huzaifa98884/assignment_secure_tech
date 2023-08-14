import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final Color starColor;

  StarRating({required this.rating, required this.starColor});

  @override
  Widget build(BuildContext context) {
    List<Widget> starWidgets = [];

    for (int i = 0; i < 5; i++) {
      double difference = rating - i;

      if (difference >= 1.0) {
        starWidgets.add(
          Image.asset(
            'assets/images/star_filled.png',
            width: 25,
            height: 25,
            color: starColor,
          ),
        );
      } else if (difference >= 0.75) {
        starWidgets.add(
          Image.asset(
            'assets/images/star_three_quarter_filled.png',
            width: 25,
            height: 25,
            color: starColor,
          ),
        );
      } else if (difference >= 0.5) {
        starWidgets.add(
          Image.asset(
            'assets/images/star_half_filled.png',
            width: 25,
            height: 25,
            color: starColor,
          ),
        );
      } else if (difference >= 0.25) {
        starWidgets.add(
          Image.asset(
            'assets/images/star_one_quarter_filled.png',
            width: 25,
            height: 25,
            color: starColor,
          ),
        );
      } else {
        starWidgets.add(
          Image.asset(
            'assets/images/star_empty.png',
            width: 25,
            height: 25,
            color: starColor,
          ),
        );
      }
    }

    return Row(children: starWidgets);
  }
}
