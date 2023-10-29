import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/show_following_model.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class FollowingRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET USER Following API *******************************
  Future<FollowingModel> getUserFollowingApi() async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();
      String? userId = await SharedPreferencesManager.getUSerId();

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.getUserFollowing}?UserId=$userId";
       //  print("-------------$url");
      dynamic response = await _apiServices.getGetApiResponse1(url, header);
      //   print(response.toString());
      return response = FollowingModel.fromJson(response);
    } catch (error) {
         print("Following Error");
      rethrow;
    }
  }
}