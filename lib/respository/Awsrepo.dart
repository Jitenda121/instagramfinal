// import 'package:another_flushbar/flushbar_helper.dart';
// import 'package:flutter_application_1/data/network/aws.dart';
// import 'package:flutter_application_1/utils/routes/routes_name.dart';
// import 'package:flutter_application_1/utils/utils.dart';
// import 'package:http/http.dart';
// //import 'package:instagram/res/route/route_name.dart';
// //import 'package:instagram/res/utils/util.dart';
// //import 'package:instagram/viewmodel/post/aws.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';

// class PostService {
//   static Future<void> addPost(BuildContext context, String description, {required String imageUrl}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String accessToken = prefs.getString("accessToken") ?? '';
//     // final String imageUrl = '$s3Endpoint/$fileName';
//     // debugPrint(imageUrl);
//     try {
//       Response response = await post(
//         Uri.parse('https://amansocial.appskeeper.in/api/v1/user/post'),
//         body: jsonEncode({
//           'picUrl': imageUrl,
//           'description': description,
//         }),
//         headers: {
//           'Authorization': "Bearer $accessToken",
//           'Content-Type': 'application/json',
//         },
//       );

//       print(response.body);

//       if (jsonDecode(response.body)["statusCode"] == 200) {
//         Utils.toastMessage("post added");
//         // FlushbarHelper.showSuccessFlushbar(context, "post added");
//         Navigator.pushNamedAndRemoveUntil(
//             context, RoutesName.homepage, (route) => false);
//       } else {
//         print(response.statusCode.toString());
//         String error = jsonDecode(response.body)["type"];
//         Utils.toastMessage("error");
//         // FlushbarHelper.showErrorFlushbar(context, error);
//       }
//     } catch (e) {
//       print(e.toString());
//       Utils.toastMessage(e.toString());

//       //FlushbarHelper.showErrorFlushbar(context, "$e");
//     }
//   }
// }
