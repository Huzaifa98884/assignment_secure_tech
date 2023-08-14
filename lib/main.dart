import 'package:assignment_secure_tech/Views/allProductsScreen.dart';
import 'package:assignment_secure_tech/Views/loginScreen.dart';
import 'package:assignment_secure_tech/Views/productDetailsScreen.dart';
import 'package:assignment_secure_tech/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants_and_widgets/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Tech Assignment',
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      initialRoute: "/login", // Use LoginScreen as the initial screen
    );
  }
}
