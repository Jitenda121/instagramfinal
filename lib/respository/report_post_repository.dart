//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:http/http.dart';

class ReportPostRepository {
  final NetworkApiService _apiServices = NetworkApiService();
  // ignore: non_constant_identifier_names
  Future<void> ReportPost(dynamic postId) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();
    try {
      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.reportpost}?postId=$postId";
      // debugPrint("------***************----************---------------");
     // debugPrint(response["type"]);
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.getreportpost(url, header);
     // debugPrint(response["type"]);
      //  Utils(response[type])
     // debugPrint("------***************----************---------------");
     // debugPrint(response["type"]);
      // debugPrint(response['body'].toString());

      // debugPrint(accessToken.toString());
    } catch (e) {
      rethrow;
    }
  }
}
