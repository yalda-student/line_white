import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_white_signup_mobile/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: AppConsts.primaryColor,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppConsts.logoPath,
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 20,),
              Text(
                'Line White',
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline4),
              ),
              Text('Enjoy your vacation with us',style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.caption),),
            ],
          ),
        ),
      ),
    );
  }
}
