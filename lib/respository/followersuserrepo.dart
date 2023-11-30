import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class FollowerUserRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET USER Followers API *******************************
  // Future<void> followUser(dynamic followingId) async {
  //   String? authToken = await SharedPreferencesManager.getLoginToken();
  //   try {
  //     dynamic header = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $authToken"
  //     };
  //     // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
  //     dynamic response = await _apiServices.getPostApiResponseForFollowUser(
  //         AppUrl.followUser, followingId, header);
  //     debugPrint(response.toString());

  //     // debugPrint(accessToken.toString());
  //     debugPrint("------***************----************---------------");
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  Future<void> followUser(dynamic data1) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();
    try {
      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.PostCommentApiResponse(
          AppUrl.followUser, data1, header);
      debugPrint(response.toString());

      // debugPrint(accessToken.toString());
      debugPrint("------***************----************---------------");
    } catch (e) {
      rethrow;
    }
  }
}
