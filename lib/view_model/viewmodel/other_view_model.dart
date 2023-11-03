import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/user_profile_model.dart';
import 'package:flutter_application_1/respository/other_repo_model.dart';
class OtherUserProfileViewModel with ChangeNotifier {
  final _myRepo = OtherUserProfileRepository ();
  ApiResponse<UserProfileModel> userProfile = ApiResponse.loading();
  setUserProfile(ApiResponse<UserProfileModel> response) {
    userProfile = response;
    notifyListeners();
  }

  Future<void> fetchUserProfile(String userId) async {
    setUserProfile(ApiResponse.loading());
    _myRepo.getUserProfileApi(userId).then((value) {
      setUserProfile(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      setUserProfile(ApiResponse.error(error.toString()));
    });
  }
}