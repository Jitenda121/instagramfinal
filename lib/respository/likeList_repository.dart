import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/likeList.dart';
import 'package:flutter_application_1/model/user_profile_model.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class LikelistRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET USER PROFILE API *******************************
  Future<LikeList> getLikeklistApi(String postId) async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();
     // String? userId = await SharedPreferencesManager.getUSerId();

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.getLikeList}?postId=$postId";
      dynamic response = await _apiServices.getGetApiResponse1(url, header);
      return response = LikeList.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}