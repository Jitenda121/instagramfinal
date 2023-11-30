import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/show_following_model.dart';
import 'package:flutter_application_1/respository/otherUserFollowing_repository.dart';
//import 'package:flutter_application_1/respository/user_following_repository.dart';

class OtherUserFollowingViewModel with ChangeNotifier {
  final _myRepo = OtherUserFollowingRepository();
  ApiResponse<FollowingModel> userFollowing = ApiResponse.loading();
  setOtherProfileFollowing(ApiResponse<FollowingModel> response) {
    userFollowing = response;
    notifyListeners();
  }

  Future<void> fetchOtherUserFollowing(userId) async {
    //   print("fetchUserFollowing");
    setOtherProfileFollowing(ApiResponse.loading());
    _myRepo.getOtherUserFollowingApi(userId).then((value) {
      //   print("fetchUserFollowing Complete");
      setOtherProfileFollowing(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      //   print("fetchUserFollowing Error");
      setOtherProfileFollowing(ApiResponse.error(error.toString()));
    });
  }
}
