import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';


class DeleteCommentRepository {
  final NetworkApiService _apiServices = NetworkApiService();
  // ignore: non_constant_identifier_names
  Future<void> deleteComment(dynamic postId, dynamic commentId) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();
    try {
      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url =
          "${AppUrl.deleteComment}?postId=$postId&commentId=$commentId";
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.deleteComment(url, header);
      debugPrint(response.toString());

      // debugPrint(accessToken.toString());
      debugPrint("------***************----************---------------");
    } catch (e) {
      rethrow;
    }
  }
}