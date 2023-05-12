/*
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huddle',
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}
*/




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huddle/routes/app_routes.dart';

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
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'huddle',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.signUpScreen,
      routes: AppRoutes.routes,
    );
  }
}
