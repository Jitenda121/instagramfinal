import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/User_feeds.dart';
import 'package:flutter_application_1/model/user_profile_model.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';
import 'package:flutter_application_1/view_model/viewmodel/User_feeds_model.dart';

class UserFeedsRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET USER PROFILE API *******************************
  Future<UserFeeds> getUserfeeds() async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();
      // String? userId = await SharedPreferencesManager.getUSerId();
      // UserFeedsViewModel userFeedsViewModel = UserFeedsViewModel();
      // userFeedsViewModel.fetchUserfeeds();
      String apiUrl =
          'https://pranavsocial.appskeeper.in/api/v1/user/user-feed';

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "$authToken"
      };

      dynamic response = await _apiServices.getApiResponse(apiUrl, header);
      debugPrint("-----------response1213213-----------------");

      debugPrint(response.toString());
      return response = UserFeeds.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
