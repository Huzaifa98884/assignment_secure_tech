import 'package:assignment_secure_tech/constants_and_widgets/starRaingWidget.dart';
import 'package:flutter/material.dart';

class ReviewsWidget extends StatelessWidget {
  final int reviewCount;
  final double rating;

  ReviewsWidget({required this.reviewCount, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews ($reviewCount)',
                  style: TextStyle(
                    color: Color(0xFF444A51),
                    fontSize: 15,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  '$rating',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                StarRating(
                  rating: rating,
                  starColor: Color(0xFFFFE072),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
