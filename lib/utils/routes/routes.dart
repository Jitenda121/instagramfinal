import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screen/login_screen.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
//import 'package:flutter_application_1/view/bottom_navigationbartab.dart/account.dart';
//import 'package:flutter_application_1/view/bottom_navigationbartab.dart/search.dart';
import 'package:flutter_application_1/view/bottom_navigationbartab/account.dart';
import 'package:flutter_application_1/view/bottom_navigationbartab/search.dart';
import 'package:flutter_application_1/view/complete_profile.dart';
import 'package:flutter_application_1/view/edit_profile.dart';
import 'package:flutter_application_1/view/forget_password.dart';
import 'package:flutter_application_1/view/homepage.dart';
import 'package:flutter_application_1/view/login_screen.dart';
import 'package:flutter_application_1/view/new_password_screen.dart';
import 'package:flutter_application_1/view/otp_screen.dart';
//import 'package:flutter_application_1/view/owner_profile.dart';
//import 'package:flutter_application_1/view/search_page.dart';
import 'package:flutter_application_1/view/sign_up.dart';
import 'package:flutter_application_1/view/splash_sevices.dart';
//import 'package:flutter_application_1/view/tab1home/account.dart';
//import 'package:flutter_application_1/view/tab1home/search.dart';
import 'package:flutter_application_1/view/tutorial1.dart';
import 'package:flutter_application_1/view/user_followers.dart';
import 'package:flutter_application_1/view/user_following.dart';

class Routes {
  // ignore: non_constant_identifier_names
  static Route<dynamic> MaterialPageRoutegenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.followers:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const Followers());

      case RoutesName.loginscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.search:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Search_Page());

      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SpalshServices());

      case RoutesName.homepage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());

      case RoutesName.otp:
        if (settings.arguments != null) {
          return MaterialPageRoute(
              builder: (BuildContext context) => OTP(
                    userEmail: settings.arguments as String,
                  ));
        } else {
          return MaterialPageRoute(
              builder: (_) => const Scaffold(
                    body: Center(
                      child: Text("No Routes Found "),
                    ),
                  ));
        }

      case RoutesName.completeprofile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CompleteProfile());

      case RoutesName.forgetpassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgetPassword());

      case RoutesName.signupscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpScreen());

      case RoutesName.tutorial1:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TutorialScreen1());

      case RoutesName.reset:
        // String args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => ChangePasswordScreen());

      // case RoutesName.following:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const Following());

      case RoutesName.editprofile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EditProfile());

      case RoutesName.owner:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OwnerProfile());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("No Routes Found "),
                  ),
                ));
    }
  }
}
