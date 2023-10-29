import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/show_following_model.dart';
import 'package:flutter_application_1/respository/user_following_repository.dart';
class UserFollowingViewModel with ChangeNotifier {
  final _myRepo = FollowingRepository();
  ApiResponse<FollowingModel> userFollowing = ApiResponse.loading();
  setProfileFollowing(ApiResponse<FollowingModel> response) {
    userFollowing = response;
    notifyListeners();
  }

  Future<void> fetchUserFollowing() async {
    //   print("fetchUserFollowing");
    setProfileFollowing(ApiResponse.loading());
    _myRepo.getUserFollowingApi().then((value) {
      //   print("fetchUserFollowing Complete");
      setProfileFollowing(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      //   print("fetchUserFollowing Error");
      setProfileFollowing(ApiResponse.error(error.toString()));
    });
  }
}
