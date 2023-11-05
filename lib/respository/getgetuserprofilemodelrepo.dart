

import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/getuserpost.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class GetUserostRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET USER PROFILE API *******************************
  Future<GetUserPost> getUserProfileApi(dynamic postId) async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();
      String? userId = await SharedPreferencesManager.getUSerId();

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.getuserpost}?postId=$postId";
      dynamic response = await _apiServices.getGetApi(url, header);
      return response = GetUserPost.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}