import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
//import 'package:flutter_application_1/view/tutorial1.dart';
import 'package:lottie/lottie.dart';
//import '../view_model/services/splash_services.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  //SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // debugPrint("djhbkcv");
   
    super.initState();
    _navigateTutorail();
    //splashServices.checkAuthentication(context);
  }

  _navigateTutorail() async {
    await Future.delayed(const Duration(seconds: 10), () {});
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

  // navigateTutorail() async {
  //   await Future.delayed(Duration(seconds: 10), () {});
  //   Navigator.pushNamed(context, RoutesName.tutorial1);
  //   // Navigator.push(
  //   //     context, MaterialPageRoute(builder: ((context) => TutorialScreen1())));
  // }
}
