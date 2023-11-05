import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/SearchModal.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class SearchUserRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET SEARCH USER PROFILE API *******************************
  Future<SearchUser> getUserProfileApi(String name) async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();
      // String? userId = await SharedPreferencesManager.getUSerId();

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.getSeachUserProfile}?name=$name";
      debugPrint("url"+ url);
      dynamic response = await _apiServices.getGetApiResponseNew(url, header);
      return response = SearchUser.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}