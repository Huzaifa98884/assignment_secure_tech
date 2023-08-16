enum ApiEndpoint {
  login,
  allProducts,
  singleProduct,
}

class ApiConstants {
  static const String baseUrl = 'https://fakestoreapi.com';
  static String? token;

  static String getEndpoint(ApiEndpoint endpoint, [int? productId]) {
    final tokenQuery = token != null ? 'token=${Uri.encodeComponent(token!)}' : '';

    switch (endpoint) {
      case ApiEndpoint.login:
        return '$baseUrl/auth/login';
      case ApiEndpoint.allProducts:
        return '$baseUrl/products?$tokenQuery';
      case ApiEndpoint.singleProduct:
        if (productId != null) {
          return '$baseUrl/products/$productId?$tokenQuery';
        }
        throw ArgumentError('productId must be provided for single Product');
    }
  }
}
