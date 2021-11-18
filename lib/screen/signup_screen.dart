import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_white_signup_mobile/constants.dart';
import 'package:line_white_signup_mobile/widget/login_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                        '${AppConsts.rootPath}arrow-left-thick.png')),
              ),
              Center(
                child: Stack(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 85,
                      child: Icon(
                        Icons.photo,
                        size: 35,
                        color: AppConsts.primaryColor,
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppConsts.primaryColor,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff0045BB),
                          child:
                              Icon(Icons.upload, size: 35, color: Colors.white),
                          radius: 24,
                        ),
                      ),
                      right: 0,
                      bottom: 0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Center(
                  child: Text('Hello,\nWelcome',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.normal)))),
              const SizedBox(
                height: 35,
              ),
              const Center(child: SignupForm()),
              const Center(child: LoginWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  bool usePhoneNumber = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: usePhoneNumber,
                fillColor: MaterialStateProperty.all(Colors.white),
                onChanged: (value) {
                  setState(() {
                    usePhoneNumber = value!;
                  });
                },
              ),
              Text('Use mobile number',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.caption))
            ],
          ),
          usePhoneNumber
              ? const CustomTextField(
                  label: 'Phone number',
                  icon: Icons.phone_rounded,
                  inputType: TextInputType.phone)
              : const CustomTextField(
                  label: 'Email',
                  icon: Icons.email_rounded,
                  inputType: TextInputType.emailAddress),
          const SizedBox(height: 10),
          const CustomTextField(
            label: 'Password',
            icon: Icons.lock_rounded,
            inputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 140,
            height: 40,
            child: ElevatedButton(
                onPressed: () {},
                child:
                    Text('Sign Up', style: Theme.of(context).textTheme.caption),
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: AppConsts.buttonBgColor))),
                    backgroundColor:
                        MaterialStateProperty.all(AppConsts.buttonBgColor))),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextInputType inputType;

  const CustomTextField(
      {Key? key,
      required this.label,
      required this.icon,
      required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        height: 49,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: AppConsts.primaryColor),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8),
              child: VerticalDivider(
                color: AppConsts.seconaryTextColor,
                width: 10,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                keyboardType: inputType,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text(
                      label,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: AppConsts.seconaryTextColor)),
                    )),
              ),
            ),
          ],
        ));
  }
}
