import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
//import 'package:flutter_application_1/view/sign_up.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class TutorialScreen1 extends StatefulWidget {
  const TutorialScreen1({super.key});

  @override
  State<TutorialScreen1> createState() => _TutorialScreen1State();
}

class _TutorialScreen1State extends State<TutorialScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        autoScrollDuration: 1500,
        globalBackgroundColor: Colors.white,
        showNextButton: false,
        showDoneButton: true,
        onDone: () {
          //Navigator.pushNamed(context, RoutesName.loginscreen);
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.loginscreen, 
              (route) => false);
          // Navigator.pushAndRemoveUntil(
          //     context, RoutesName.loginscreen, (route) => false);
        },
        done: const Text("Let's Start",
            style: TextStyle(fontWeight: FontWeight.w600)),
        pages: [
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: [
                const SizedBox(height: 90), // Add space before the title
                const Text(
                  "Connect With the People around you",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                const SizedBox(height: 50), // Add space after the title
                Lottie.asset(
                  AppImage.tutorialimage1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.login);
                    // Handle skip button press (navigate to the desired screen)
                    // _onIntroEnd(context);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ), // Replace with your image path
              ],
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: [
                const SizedBox(height: 80), // Add space before the title
                const Text(
                  "Connect With the People around you",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                
                const SizedBox(height: 50), // Add space after the title
                Lottie.asset(
                  AppImage.tutorialimage2,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.login);
                    
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ), // Replace with your image path
              ],
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: [
                const SizedBox(height: 90), // Add space before the title
                const Text(
                  "Connect With the People around you",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                const SizedBox(height: 50), // Add space after the title
                Lottie.asset(
                  //AppImage.tutorialimage2,
                  AppImage.tutorialimage3,
                ) // Replace with your image path
              ],
            ),
          ),
        ],
      ),
    );
  }
}
