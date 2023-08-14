import 'package:assignment_secure_tech/constants_and_widgets/starRaingWidget.dart';
import 'package:flutter/material.dart';

class AllProductsWidget extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String productName;
  final String description;
  final double rating;
  final VoidCallback onPressed;

  AllProductsWidget({
    required this.imageUrl,
    required this.price,
    required this.productName,
    required this.description,
    required this.rating,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        GestureDetector(
          onTap: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width:
                  MediaQuery.of(context).size.width * 0.8, // Adjust the width
              height:
                  MediaQuery.of(context).size.height / 3.5, // Adjust the height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).width * 0.045,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        height: 1.45,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: StarRating(
                        rating: rating.toDouble(),
                        starColor: Color(0xFFFFE072),
                      )),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        Text(
          productName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF444A51),
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w300,
            height: 1.57,
            letterSpacing: 0.17,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF08293B),
            fontSize: 10,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w400,
            height: 1.50,
            letterSpacing: 0.17,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        Divider(),
      ],
    );
  }
}
