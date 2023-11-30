import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/getuserpost.dart';
import 'package:flutter_application_1/respository/getgetuserprofilemodelrepo.dart';
class GetUserProfileViewModel with ChangeNotifier {
  final _myRepo = GetUserostRepository();
  ApiResponse<GetUserPost> getUserPost = ApiResponse.loading();
  setUserProfile(ApiResponse<GetUserPost> response) {
    getUserPost = response;
    notifyListeners();
  }

  Future<void> fetchUserProfile(dynamic postId) async {
    debugPrint("in fetch user");
    debugPrint(postId);
    setUserProfile(ApiResponse.loading());
    _myRepo.getUserProfileApi(postId).then((value) {
      setUserProfile(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      setUserProfile(ApiResponse.error(error.toString()));
    });
  }
}
