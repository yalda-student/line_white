import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_white_signup_mobile/screen/signup_screen.dart';
import 'package:line_white_signup_mobile/widget/login_widget.dart';

import '../constants.dart';
import '../widget/login_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String pageRoute = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(
              height: 20,
            ),
            Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4),
            ),
            Text(
              "It's easier to sign up now",
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.caption),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 270,
              height: 54,
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    '${AppConsts.rootPath}facebook.png',
                  ),
                  label: Text('Continue with Facebook',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: AppConsts.primaryColor)),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.white))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white))),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 270,
              height: 54,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignupScreen.pageRoute);
                  },
                  child: Text("I'll use email or phone",
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.caption,
                      )),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.white))))),
            ),
            const SizedBox(
              height: 20,
            ),
            const SocialMediaWidget(),
            const LoginWidget()
          ],
        ),
      ),
    );
  }
}

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset('${AppConsts.rootPath}google-plus.png')),
        IconButton(
            onPressed: () {},
            icon: Image.asset('${AppConsts.rootPath}twitter.png')),
        IconButton(
            onPressed: () {},
            icon: Image.asset('${AppConsts.rootPath}linkedin.png')),
      ],
    );
  }
}
