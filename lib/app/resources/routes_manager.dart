import 'package:coffee_wonders/presentation/auth/view/login_screen.dart';
import 'package:coffee_wonders/presentation/cart/view/cart_screen.dart';
import 'package:coffee_wonders/presentation/checkout/view/checkout_screen.dart';
import 'package:coffee_wonders/presentation/layout/view/layout_screen.dart';
import 'package:coffee_wonders/presentation/notification/view/notification_screen.dart';
import 'package:coffee_wonders/presentation/search/view/search_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../presentation/auth/view/register_screen.dart';
import '../../presentation/my_orders/view/my_orders_screen.dart';
import '../../presentation/splash_screen/splash_Screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String layoutRoute = "/layoutRoute";
  static const String searchRoute = "/searchRoute";
  static const String checkoutRoute = "/checkoutRoute";
  static const String cartRoute = "/cartRoute";
  static const String notificationRoute = "/notificationRoute";
  static const String myOrdersRoute = "/myOrdersRoute";
  static const String loginRoute = "/loginRoute";
  static const String registerRoute = "/registerRoute";
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
      case Routes.searchRoute:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      case Routes.checkoutRoute:
        return MaterialPageRoute(
          builder: (_) => const CheckoutScreen(),
        );
      case Routes.cartRoute:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case Routes.notificationRoute:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case Routes.myOrdersRoute:
        return MaterialPageRoute(
          builder: (_) => const MyOrdersScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
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
