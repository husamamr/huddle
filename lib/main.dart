import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huddle/presentation/bottomBar/bottom_bar.dart';
import 'package:huddle/presentation/buissnesOwner/pick_account_type.dart';
import 'package:huddle/presentation/sign_up_screens/otp_screen.dart';
import 'package:huddle/routes/app_routes.dart';

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

      home: BottomBar(),
      // initialRoute: AppRoutes.signUpScreen,
      // routes: AppRoutes.routes,
    );
  }
}
