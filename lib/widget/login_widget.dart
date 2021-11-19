import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_white_signup_mobile/screen/login_screen.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have account?',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.caption,
            )),
        TextButton(
          child: Text('Login',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.caption!.copyWith(
                    color: const Color(0xff07079A),
                    decoration: TextDecoration.underline),
              )),
          onPressed: () {
            Navigator.of(context).pushNamed(LoginScreen.pageRoute);
          },
        ),
      ],
    );
  }
}
