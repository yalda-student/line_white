import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_white_signup_mobile/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  static const String pageRoute = '/main-screen';
  var _imageFile;
  var _userInfo;

  Future<String?> initData() async {
    final prefs = await SharedPreferences.getInstance();

    _imageFile = prefs.getString('user_img');
    return _imageFile;
  }

  Future<Map<String, dynamic>> initInfo() async {
    final prefs = await SharedPreferences.getInstance();
    _userInfo = json.decode(prefs.getString('user_info')!);
    return _userInfo;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    _userInfo['isLoggedIn'] = false;
    prefs.setString('user_info', json.encode(_userInfo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'Line White',
            style: TextStyle(color: AppConsts.primaryColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
                future: initData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return Container(
                      width: 170,
                      height: 170,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundImage: Image.file(
                          File(snapshot.data as String),
                          fit: BoxFit.cover,
                        ).image,
                        backgroundColor: Colors.white,
                      ),
                    );
                  }
                  return const CircleAvatar(
                      backgroundColor: AppConsts.primaryColor,
                      radius: 85,
                      child: Icon(
                        Icons.photo,
                        size: 35,
                        color: Colors.white,
                      ));
                }),
            const SizedBox(height: 30),
            FutureBuilder(
              future: initInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: _InfoWidget(
                      info: snapshot.data as Map<String, dynamic>,
                    ),
                  );
                }
                return const Text('No Data available!');
              },
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                color: Colors.white70,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ExpansionTile(
                    title: Text(
                      'Setting',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline6,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    leading: const Icon(
                      Icons.settings,
                      color: AppConsts.primaryColor,
                    ),
                    childrenPadding: const EdgeInsets.only(left: 20),
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.exit_to_app_rounded),
                        title: const Text('Log out'),
                        onTap: () {
                          logout();
                          Navigator.of(context).pushNamed(HomeScreen.pageRoute);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_remove_alt_1_rounded),
                        title: const Text('Delete account'),
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.remove('user_info');
                          prefs.remove('user_img');
                          Navigator.of(context).pushNamed(HomeScreen.pageRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  final Map<String, dynamic> info;

  const _InfoWidget({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildInfoItem(context, 'email', 'Email', Icons.email_rounded),
          _buildInfoItem(context, 'phoneNumber', 'Phone Number', Icons.phone),
        ],
      ),
    );
  }

  Padding _buildInfoItem(
      BuildContext context, String key, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white70,
        elevation: 2,
        child: ListTile(
          leading: Icon(
            icon,
            color: AppConsts.primaryColor,
          ),
          title: Text(
            info[key],
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headline6,
                color: Colors.black),
          ),
          subtitle: Text(
            subtitle,
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.caption,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
