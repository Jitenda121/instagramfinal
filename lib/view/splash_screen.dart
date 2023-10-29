import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';
import 'package:flutter_application_1/view/homepage.dart';
import 'package:flutter_application_1/view/splash_sevices.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginToken();
  }

  _checkLoginToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginToken = await SharedPreferencesManager.getLoginToken();

    if (loginToken != null) {
      // Login token exists, navigate to the homepage.
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // Login token is null, navigate to the splash screen.
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SpalshServices()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(child: Lottie.asset(AppImage.splashscreen)),
    ));
  }
}
