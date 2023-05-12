import 'package:flutter/material.dart';
import 'package:huddle/presentation/signup_login_module_screen/signup_login_module_screen.dart';
import 'package:huddle/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:huddle/presentation/user_groups_screen/user_groups_screen.dart';

class AppRoutes {
  static const String signupLoginModuleScreen = '/signup_login_module_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String userGroupsScreen = '/user_groups_screen';

  static Map<String, WidgetBuilder> routes = {
    signupLoginModuleScreen: (context) => SignupLoginModuleScreen(),
    signUpScreen: (context) => SignUpScreen(),
    userGroupsScreen: (context) => UserGroupsScreen(),
  };
}
