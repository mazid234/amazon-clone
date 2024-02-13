import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_app/main.dart';
import 'package:amazon_clone_app/mvc/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mvc/binding/product_binding.dart';

class Routes {
  static const String Homepage = "/homepage";
  static const String AuthScreen = "/auth-screen";
  static const String MyHomePage = "/my-homepage";
}

// generateRoute(RouteSettings routeSettings) {
//   switch (routeSettings.name) {
//     case Routes.AuthScreen:
//       return MaterialPageRoute(
//         builder: (_) => AuthScreen(),
//       );
//     default:
//       MaterialPageRoute(
//         builder: (_) => const Scaffold(
//           body: Center(child: Text("Page not found")),
//         ),
//       );
//   }
// }
final getPages = [
  GetPage(
      name: Routes.Homepage,
      page: () => const Homepage(),
      binding: ProductBind()),
  GetPage(
    name: Routes.AuthScreen,
    page: () => const AuthScreen(),
  ),
  GetPage(
    name: Routes.MyHomePage,
    page: () => const MyHomePage(),
  )
];
