enum ApiEndpoint {
  login,
  allProducts,
  singleProduct,
}

class ApiConstants {
  static const String baseUrl = 'https://fakestoreapi.com';

  static String getEndpoint(ApiEndpoint endpoint, [int? productId]) {
    switch (endpoint) {
      case ApiEndpoint.login:
        return '$baseUrl/auth/login';
      case ApiEndpoint.allProducts:
        return '$baseUrl/products';
      case ApiEndpoint.singleProduct:
        if (productId != null) {
          return '$baseUrl/products/$productId';
        }
        throw ArgumentError('productId must be provided for single Product');
    }
  }
}
