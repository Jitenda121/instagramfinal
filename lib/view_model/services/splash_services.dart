// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/utils/routes/routes_name.dart';
// import 'package:flutter_application_1/view/homepage.dart';
// import 'package:flutter_application_1/view/login_screen.dart';

// class SplashServices {
//   Future<UserModel> getUserData() => UserViewModel().getUser();

//   void checkAuthentication(BuildContext context) async {
//     getUserData().then((value)async {
//       if (value.token == 'null' || value.token == '') {
//           await Future.delayed(Duration(seconds: 3));
//         Navigator.pushNamed(context, RoutesName.login);
//       } else  {
//           await Future.delayed(Duration(seconds: 3));
//         Navigator.pushNamed(context, RoutesName.home);
//       }
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
// }
