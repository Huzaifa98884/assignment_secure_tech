import 'dart:convert';
import 'package:assignment_secure_tech/Models/allProductsModel.dart';
import 'package:http/http.dart' as http;

class AllProductsController {
  Future<List<AllProductsModel>> fetchProducts(String url, String token) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token', // Include the token in the headers
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => AllProductsModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
