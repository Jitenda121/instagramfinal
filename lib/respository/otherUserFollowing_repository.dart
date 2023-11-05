
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/show_following_model.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';


class OtherUserFollowingRepository {
  final NetworkApiService _apiServices = NetworkApiService();


  // **************************** GET Other USER Following API *******************************
  Future<FollowingModel> getOtherUserFollowingApi(String userId) async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.getUserFollowing}?UserId=$userId";
      //  print("-------------$url");
      dynamic response = await _apiServices.getGetApi(url, header);
      //   print(response.toString());
      return response = FollowingModel.fromJson(response);
    } catch (error) {
      print("Following Error");
      rethrow;
    }
  }
}