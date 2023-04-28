import 'package:flutter/material.dart';
import 'package:huddle/presentation/register_page_screen/register_page_screen.dart';
import 'package:huddle/presentation/standard_form_screen/standard_form_screen.dart';
import 'package:huddle/presentation/business_form_screen/business_form_screen.dart';
import 'package:huddle/presentation/splash_screan_screen/splash_screan_screen.dart';
import 'package:huddle/presentation/login_page_screen/login_page_screen.dart';
import 'package:huddle/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String registerPageScreen = '/register_page_screen';

  static const String standardFormScreen = '/standard_form_screen';

  static const String businessFormScreen = '/business_form_screen';

  static const String splashScreanScreen = '/splash_screan_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    registerPageScreen: (context) => RegisterPageScreen(),
    standardFormScreen: (context) => StandardFormScreen(),
    businessFormScreen: (context) => BusinessFormScreen(),
    splashScreanScreen: (context) => SplashScreanScreen(),
    loginPageScreen: (context) => LoginPageScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
