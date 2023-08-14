import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '../Controllers/loginController.dart';
import '../Models/loginModel.dart';
import '../Models/loginResponseModel.dart';
import '../constants_and_widgets/constants.dart';
import '../constants_and_widgets/textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginController _loginController = LoginController();

  bool _isLoading = false;

  Future<void> _performLogin() async {
    if (_isLoading) {
      return;
    }

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Kindly fill all the fields",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else {
      setState(() {
        _isLoading = true;
      });

      final loginModel = LoginModel(
        username: emailController.text,
        password: passwordController.text,
      );

      final loginResponse = await _loginController.loginUser(loginModel);

      if (loginResponse.token != null) {
        Navigator.pushReplacementNamed(context, "/all_products");
      } else {
        Fluttertoast.showToast(
          msg: "User-name or Password is incorrect",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(gradient: gradientBlue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "STC",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "HEALTH",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontFamily: "SF Pro Display",
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    UnderlinedTextField(
                      label: 'Email',
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    UnderlinedTextField(
                      label: 'Password',
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextButton(
                              onPressed: _isLoading ? null : _performLogin,
                              style: TextButton.styleFrom(
                                backgroundColor: blueLight,
                                padding: EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
                              child: Text(
                                _isLoading ? '' : 'Continue',
                                style: TextStyle(
                                  fontFamily: "SF Pro Display",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 20 / 17,
                                ),
                              ),
                            ),
                          ),
                          if (_isLoading)
                            Positioned.fill(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
