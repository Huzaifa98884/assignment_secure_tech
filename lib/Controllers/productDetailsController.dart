import 'dart:convert';

import '../Models/allProductsModel.dart';
import 'package:http/http.dart' as http;

class ProductDetailsController {
  Future<AllProductsModel> fetchProductDetails(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return AllProductsModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch product');
    }
  }
}
