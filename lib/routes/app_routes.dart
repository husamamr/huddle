import 'dart:js';

import 'package:flutter/material.dart';
import 'package:huddle/presentation/sign_up_screens/sign_up_screen_personal_info.dart';
import 'package:huddle/presentation/user_groups_screen/user_groups_screen.dart';
import 'package:huddle/presentation/sign_up_screens/otp_screen.dart';
import 'package:huddle/presentation/HomeScreen/home_screen.dart';
import 'package:huddle/presentation/floatingActionButton/floatingButton.dart';


class AppRoutes {
  static const String signupLoginModuleScreen = '/signup_login_module_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String userGroupsScreen = '/user_groups_screen';
  static const String otp_screen = '/otp_screen';
  static const String home_screen = '/home_screen';



  static Map<String, WidgetBuilder> routes = {
    signUpScreen: (context) => SignUpScreen(),
    userGroupsScreen: (context) => UserGroupsScreen(),
    home_screen: (context)=> HomeScreen(),
   // otp_screen: (context) => OtpScreen(),
  };
}
