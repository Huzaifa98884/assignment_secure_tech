import 'package:flutter/material.dart';
import '../Views/allProductsScreen.dart';
import '../Views/loginScreen.dart';
import '../Views/productDetailsScreen.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    LoginScreen.routeName: (context) => LoginScreen(),
    AllProductsScreen.routeName: (context) => AllProductsScreen(),
    ProductDetailsScreen.routeName: (context) {
      final productId = ModalRoute.of(context)?.settings.arguments as int;
      return ProductDetailsScreen(productId: productId);
    },
  };
}
