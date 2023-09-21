import 'package:coffee_wonders/presentation/about_us/view/abou_us_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../presentation/cart/view/cart_screen.dart';
import '../../presentation/layout/view/layout_screen.dart';
import '../../presentation/splash_screen/view/splash_screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String layoutRoute = "/layoutRoute";
  static const String checkoutRoute = "/checkoutRoute";
  static const String cartRoute = "/cartRoute";
  static const String aboutUsRoute = "/aboutUsRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.layoutRoute:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.cartRoute:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );

      case Routes.aboutUsRoute:
        return MaterialPageRoute(
          builder: (_) => const AboutUSScreen(),
        );
      default:
        return unDefiendRoute();
    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.notFound.tr()),
        ),
        body: Center(
          child: Text(
            AppStrings.notFound.tr(),
          ),
        ),
      ),
    );
  }
}
