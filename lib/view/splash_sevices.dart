import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
//import 'package:flutter_application_1/view/tutorial1.dart';
import 'package:lottie/lottie.dart';
//import '../view_model/services/splash_services.dart';

class SpalshServices extends StatefulWidget {
  const SpalshServices({super.key});

  @override
  State<SpalshServices> createState() => _SpalshServicesState();
}

class _SpalshServicesState extends State<SpalshServices> {
  //SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // debugPrint("djhbkcv");

    super.initState();
    _navigateTutorail();
    //splashServices.checkAuthentication(context);
  }

  _navigateTutorail() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushNamed(context, RoutesName.tutorial1);
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint("jcd1111");
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            color: Colors.white,
            child: Lottie.asset(AppImage.splashscreen),
          ),
        ));
  }
}
