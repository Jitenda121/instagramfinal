import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/user_profile_model.dart';
import 'package:flutter_application_1/respository/user_profile_repository.dart';
class UserProfileViewModel with ChangeNotifier {
  final _myRepo = UserProfileRepository();
  ApiResponse<UserProfileModel> userProfile = ApiResponse.loading();
  setUserProfile(ApiResponse<UserProfileModel> response) {
    userProfile = response;
    notifyListeners();
  }

  Future<void> fetchUserProfile() async {
    setUserProfile(ApiResponse.loading());
    _myRepo.getUserProfileApi().then((value) {
      setUserProfile(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      setUserProfile(ApiResponse.error(error.toString()));
    });
  }
}