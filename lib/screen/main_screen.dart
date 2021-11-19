import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_white_signup_mobile/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String pageRoute = '/main-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConsts.primaryColor,
      body: Center(
        child: Text(
          'Hi',
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headline4),
        ),
      ),
    );
  }
}
