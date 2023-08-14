import 'package:assignment_secure_tech/constants_and_widgets/apiConstants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/loginModel.dart';
import '../Models/loginResponseModel.dart';

class LoginController {
  Future<LoginResponse> loginUser(LoginModel loginModel) async {
    final url = Uri.parse(ApiConstants.getEndpoint(ApiEndpoint.login));
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(loginModel.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return LoginResponse.fromJson(responseData);
    } else {
      return LoginResponse(message: "Server error");
    }
  }
}
