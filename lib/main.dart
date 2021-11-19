import 'package:flutter/material.dart';
import 'package:line_white_signup_mobile/constants.dart';
import 'package:line_white_signup_mobile/screen/login_screen.dart';
import 'package:line_white_signup_mobile/screen/main_screen.dart';
import 'package:line_white_signup_mobile/screen/signup_screen.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppConsts.primaryColor,
          textTheme: const TextTheme(
            caption:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            headline4:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          )),
      home: const HomeScreen(),
      routes: {
        HomeScreen.pageRoute: (BuildContext context) => const HomeScreen(),
        LoginScreen.pageRoute: (BuildContext context) => const LoginScreen(),
        SignupScreen.pageRoute: (BuildContext context) => const SignupScreen(),
        MainScreen.pageRoute: (BuildContext context) => const MainScreen(),
      },
    );
  }
}
