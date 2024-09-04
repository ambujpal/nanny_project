import 'package:flutter/material.dart';
import 'package:nany/presentation/home_page_navigation.dart';
import 'package:nany/utils/app_text_style.dart';
import 'package:nany/utils/routes/app_routes_name.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.homeNavigationScreen:
        return MaterialPageRoute(
            builder: (context) => const HomePageNavigation());

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text(
                "No route defined",
                style: AppTextStyle.ts16MB,
              ),
            ),
          );
        });
    }
  }
}
