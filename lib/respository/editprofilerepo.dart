import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';


class EditPostRepository {
  final NetworkApiService _apiServices = NetworkApiService();
  // ignore: non_constant_identifier_names
  Future<void> editPost(dynamic postId,dynamic data) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();
    try {
      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url =
          "${AppUrl.editPost}?postId=$postId";
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.editCommentAp(url, data,header);
      debugPrint(response.toString());

      // debugPrint(accessToken.toString());
      debugPrint("------***************----************---------------");
    } catch (e) {
      rethrow;
    }
  }
}