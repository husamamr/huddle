import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huddle/presentation/GroupsScreens/group_details_screen.dart';
import 'package:huddle/presentation/bottomBar/bottom_bar.dart';
import 'package:huddle/presentation/buissnesOwner/bo_inner_screens/bottom_bar_bo.dart';
import 'package:huddle/presentation/buissnesOwner/pick_account_type.dart';
import 'package:huddle/presentation/sign_up_screens/otp_screen.dart';
import 'package:huddle/routes/app_routes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'data/sign_up_repo/sign_up_repo.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //call test repo fucntion here

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'huddle',
      debugShowCheckedModeBanner: false,

      //home: GroupDetails(groupID: "sdsd", joinID: "# 1111", groupName: "uni"),
      // home: BottomBarBO(),
      home: AnimatedSplashScreen(
        splash: 'assets/images/spl2.png',
        backgroundColor: Colors.black,
        duration: 2000,
        splashIconSize: 400,
        nextScreen: BottomBarBO(),
        splashTransition: SplashTransition.fadeTransition,
      ),
      // initialRoute: AppRoutes.signUpScreen,
      // routes: AppRoutes.routes,
    );
  }
}
