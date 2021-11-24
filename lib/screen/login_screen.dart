import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_white_signup_mobile/screen/signup_screen.dart';
import 'package:line_white_signup_mobile/widget/information_widget.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String pageRoute = '/login-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConsts.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConsts.primaryColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppConsts.logoPath,
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headline4),
                ),
              ),
              Center(
                child: Text(
                  "Enjoy your application",
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.caption),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                  child: InformationForm(
                title: AppConsts.signIn,
              )),
              Center(
                child: TextButton(
                  child: Text(
                    'Forgot your password?',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New User?',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.caption,
                      )),
                  TextButton(
                    child: Text('Create an account',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: const Color(0xff07079A)),
                        )),
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignupScreen.pageRoute);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
