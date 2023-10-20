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
        autoScrollDuration: 2000,
        globalBackgroundColor: Colors.white,
        showNextButton: false,
        showDoneButton: true,
        onDone: () {
          Navigator.pushNamed(context, RoutesName.loginscreen);
//  Navigator.push(
//  context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },

        done: const Text("Let's Start",
            style: TextStyle(fontWeight: FontWeight.w600)),

        // showSkipButton: true, // Hide the "Done" button
        // Show the "Skip" button
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
                ) // Replace with your image path
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
                  AppImage.tutorialimage2,
                ) // Replace with your image path
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
