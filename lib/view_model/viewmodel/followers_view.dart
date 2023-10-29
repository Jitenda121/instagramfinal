import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/show_followers.dart';
import 'package:flutter_application_1/respository/user_follower_reposotory.dart';
class UserFollowersViewModel with ChangeNotifier {
  final _myRepo = FollowersRepository();
  ApiResponse<FollowersModel> userFollowers = ApiResponse.loading();
  setProfileFollowers(ApiResponse<FollowersModel> response) {
    userFollowers = response;
    notifyListeners();
  }

  Future<void> fetchUserFollowers() async {
       print("fetchUserFollowers");
    setProfileFollowers(ApiResponse.loading());
    _myRepo.getUserFollowersApi().then((value) {
         print("fetchUserFollowers Complete");
      setProfileFollowers(ApiResponse.success(value));
    }).onError((error, stackTrace) {
         print("fetchUserFollowers Error");
      setProfileFollowers(ApiResponse.error(error.toString()));
    });
  }
}