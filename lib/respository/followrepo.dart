import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/show_followers.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class FollowersRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET USER Followers API *******************************
  Future<FollowersModel> getUserFollowersApi() async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();
      String? userId = await SharedPreferencesManager.getUSerId();

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.getUserFollowers}?UserId=$userId";
         print("-------------$url");
      dynamic response = await _apiServices.getGetApiResponse1(url, header);
         print(response.toString());
      return response = FollowersModel.fromJson(response);
    } catch (error) {
         print("Followers Error");
      rethrow;
    }
  }

  // **************************** GET USER Followers API *******************************
  // Future<FollowersModel> getOtherUserFollowersApi(String userId) async {
  //   try {
  //     String? authToken = await SharedPreferencesManager.getLoginToken();
      

  //     dynamic header = {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $authToken"
  //     };
  //     String url = "${AppUrl.getUserFollowers}?UserId=$userId";
  //        print("-------------$url");
  //     dynamic response = await _apiServices.getGetApiResponse(url, header);
  //        print(response.toString());
  //     return response = FollowersModel.fromJson(response);
  //   } catch (error) {
  //        print("Followers Error");
  //     rethrow;
  //   }
  // }
}