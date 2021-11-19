import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_white_signup_mobile/constants.dart';
import 'package:line_white_signup_mobile/widget/information_widget.dart';
import 'package:line_white_signup_mobile/widget/login_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const String pageRoute = '/signup-screen';

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
              const Center(
                child: _ProfileWidget(),
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
              const Center(
                  child: InformationForm(
                title: 'Sign Up',
              )),
              const Center(child: LoginWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileWidget extends StatefulWidget {
  const _ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<_ProfileWidget> {
  var _imageFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _imageFile == null
            ? const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 85,
                child: Icon(
                  Icons.photo,
                  size: 35,
                  color: AppConsts.primaryColor,
                ))
            : Container(
                width: 170,
                height: 170,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  backgroundImage: Image.file(
                    _imageFile,
                    fit: BoxFit.cover,
                  ).image,
                ),
              ),
        Positioned(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: AppConsts.primaryColor,
            child: CircleAvatar(
              backgroundColor: const Color(0xff0045BB),
              child: IconButton(
                icon: const Icon(Icons.upload, size: 35, color: Colors.white),
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);

                  setState(() {
                    _imageFile = File(image!.path);
                  });
                },
              ),
              radius: 24,
            ),
          ),
          right: 0,
          bottom: 0,
        ),
      ],
    );
  }
}
