import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class InformationForm extends StatefulWidget {
  final String title;
  const InformationForm({Key? key, required this.title}) : super(key: key);

  @override
  _InformationFormState createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
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
                    Text(widget.title, style: Theme.of(context).textTheme.caption),
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
