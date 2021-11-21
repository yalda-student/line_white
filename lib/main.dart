import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_white_signup_mobile/constants.dart';
import 'package:line_white_signup_mobile/screen/login_screen.dart';
import 'package:line_white_signup_mobile/screen/main_screen.dart';
import 'package:line_white_signup_mobile/screen/signup_screen.dart';
import 'screen/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Line White',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppConsts.primaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            caption:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            headline4:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          )),
      home: MainScreen(),
      routes: {
        HomeScreen.pageRoute: (BuildContext context) => const HomeScreen(),
        LoginScreen.pageRoute: (BuildContext context) => const LoginScreen(),
        SignupScreen.pageRoute: (BuildContext context) => const SignupScreen(),
        MainScreen.pageRoute: (BuildContext context) => MainScreen(),
      },
    );
  }
}
