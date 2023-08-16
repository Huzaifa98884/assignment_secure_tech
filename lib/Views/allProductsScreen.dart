import 'package:assignment_secure_tech/constants_and_widgets/apiConstants.dart';
import 'package:assignment_secure_tech/constants_and_widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Controllers/allProductsController.dart';
import '../Models/allProductsModel.dart';
import '../constants_and_widgets/allProductsWidget.dart';
import '../constants_and_widgets/customAppBar.dart';
import '../constants_and_widgets/customNavBar.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);
  static const String routeName = '/all_products';
  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final AllProductsController productController = AllProductsController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35.0),
              bottomRight: Radius.circular(35.0),
            ),
          ),
          child: CustomAppBar(
            title: "All Products",
            titleTextStyle: TextStyle(
              fontFamily: "Open Sans",
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: blueDark,
              height: 38 / 28,
            ),
            bottomRadius: 35.0,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FutureBuilder<List<AllProductsModel>>(
            future: productController.fetchProducts(
                ApiConstants.getEndpoint(ApiEndpoint.allProducts),
                ApiConstants.token!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    return AllProductsWidget(
                      imageUrl: product.image,
                      price: product.price.toString(),
                      productName: product.title,
                      description: product.description,
                      rating: product.rating['rate'].toDouble(),
                      onPressed: () {
                        Navigator.pushNamed(context, "/product_details",
                            arguments: product.id);
                        print(product.id);
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
