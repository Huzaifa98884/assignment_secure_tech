import 'package:assignment_secure_tech/Controllers/productDetailsController.dart';
import 'package:assignment_secure_tech/constants_and_widgets/apiConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Controllers/allProductsController.dart';
import '../Models/allProductsModel.dart';
import '../constants_and_widgets/constants.dart';
import '../constants_and_widgets/customIconButton.dart';
import '../constants_and_widgets/reviewsWidget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product_details';
  final int productId; // Add a property to store the product ID

  ProductDetailsScreen({required this.productId});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Future<AllProductsModel> productDetails;
  bool _isOverlayVisible = true; // Set to true to start with the overlay up
  double _overlayHeight = 0.35;
  double _imageHeight = 0.65;

  void toggleOverlayVisibility() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
      if (_isOverlayVisible) {
        _overlayHeight = 0.35;
        _imageHeight = 0.65;
      } else {
        _overlayHeight = 0.5; // Adjust these values as needed
        _imageHeight = 0.5;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    final String productUrl =
    ApiConstants.getEndpoint(ApiEndpoint.singleProduct, widget.productId);
    productDetails = ProductDetailsController().fetchProductDetails(productUrl, ApiConstants.token!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AllProductsModel>(
        future: productDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Stack(
              children: [
                Container(color: Colors.white),
                Center(child: CircularProgressIndicator()),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final product = snapshot.data!;

            return Scaffold(
              body: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: MediaQuery.of(context).size.height * _imageHeight,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.network(
                          product.image,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          top: 35,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomIconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                iconData: Icons.arrow_back,
                                iconColor: blueDark,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                product.category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.36,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 35,
                          right: 20,
                          child: CustomIconButton(
                            onPressed: () {},
                            iconData: Icons.more_vert_rounded,
                            iconColor: blueDark,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Text(
                            '${product.price} AED',
                            style: TextStyle(
                              color: Color(0xFF2A3F4B),
                              fontSize: 32,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 1.09,
                              letterSpacing: 0.40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: MediaQuery.of(context).size.height * _overlayHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, -4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: toggleOverlayVisibility,
                            icon: Icon(
                              _isOverlayVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: blueLight,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButton(
                                onPressed: () {},
                                iconColor: blueLight,
                              ),
                              SizedBox(
                                  width:
                                  MediaQuery.sizeOf(context).width * 0.05),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    0.7, // 80% of screen width
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: blueLight,
                                    padding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(26),
                                    ),
                                  ),
                                  child: const Text(
                                    'Order Now',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 1.67,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  color: Color(0xFF444A51),
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.50,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                              MediaQuery.sizeOf(context).height * 0.015),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              product.description,
                              style: const TextStyle(
                                color: Color(0xFF828395),
                                fontSize: 14,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                                height: 1.57,
                                letterSpacing: 0.17,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (!_isOverlayVisible)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: ReviewsWidget(
                                  rating: product.rating['rate'],
                                  reviewCount: product.rating['count'],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}
