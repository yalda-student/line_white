import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final Map<String, String> _userData = {
    'email': '',
    'phoneNumber': '',
    'password': '',
  };

  void _saveData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_info', json.encode(_userData));

    // Navigator.of(context).pushReplacementNamed(MainScreen.pageRoute);
  }

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
                    _formKey.currentState!.reset();
                    _userData['email'] = '';
                    _userData['phoneNumber'] = '';
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
              ? buildCustomTextField(context, 'Phone number',
                  Icons.phone_rounded, TextInputType.phone)
              : buildCustomTextField(context, 'Email', Icons.email_rounded,
                  TextInputType.emailAddress),
          const SizedBox(height: 10),
          buildCustomTextField(context, 'Password', Icons.lock_rounded,
              TextInputType.visiblePassword),
          const SizedBox(height: 30),
          SizedBox(
            width: 140,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  _saveData();
                },
                child: Text(widget.title,
                    style: Theme.of(context).textTheme.caption),
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

  Container buildCustomTextField(BuildContext context, String label,
      IconData icon, TextInputType inputType) {
    return Container(
      width: 280,
      height: 50,
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
              obscureText: label == 'Password' ? true : false,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Fill the box!';
                }
                return null;
              },
              onSaved: (value) {
                saveValue(value, label);
              },
            ),
          ),
        ],
      ),
    );
  }

  void saveValue(String? value, String label) {
    switch (label) {
      case 'Phone number':
        _userData['phoneNumber'] = value!;
        break;

      case 'Email':
        _userData['email'] = value!;
        break;

      case 'Password':
        _userData['password'] = value!;
        break;
    }
  }
}
