import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/user_profile_model.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class OtherUserProfileRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET USER PROFILE API *******************************
  Future<UserProfileModel> getUserProfileApi(String userId) async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();
     // String? userId = await SharedPreferencesManager.getUSerId();

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.getUserProfile}?userId=$userId";
      dynamic response = await _apiServices.getGetApiResponse1(url, header);
      return response = UserProfileModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}