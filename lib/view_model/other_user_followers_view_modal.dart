import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/show_followers.dart';
import 'package:flutter_application_1/respository/other_follpwer_repository.dart';

class OtherUserFollowerViewModel with ChangeNotifier {
  final _myRepo = OtherUserFollowerRepository();
  ApiResponse<FollowersModel> userFollowers = ApiResponse.loading();
  setOtherProfileFollowers(ApiResponse<FollowersModel> response) {
    userFollowers = response;
    notifyListeners();
  }

  Future<void> fetchOtherUserFollowers(userId) async {
    //   print("fetchUserFollowing");
    setOtherProfileFollowers(ApiResponse.loading());
    _myRepo.getOtherUserFollowersApi(userId).then((value) {
      //   print("fetchUserFollowing Complete");
      setOtherProfileFollowers(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      //   print("fetchUserFollowing Error");
      setOtherProfileFollowers(ApiResponse.error(error.toString()));
    });
  }
}
