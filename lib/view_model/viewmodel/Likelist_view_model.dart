import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/likeList.dart';
//import 'package:flutter_application_1/model/show_followers.dart';
import 'package:flutter_application_1/respository/likeList_repository.dart';
//import 'package:flutter_application_1/respository/user_follower_reposotory.dart';

class LikelistViewModel with ChangeNotifier {
  final _myRepo = LikelistRepository();
  ApiResponse<LikeList> listList = ApiResponse.loading();
  setLikelist(ApiResponse<LikeList> response) {
    listList = response;
    notifyListeners();
  }

  Future<void> fetchLikelist(String postId) async {
    print("fetchLikelist");
    setLikelist(ApiResponse.loading());
    _myRepo.getLikeklistApi(postId).then((value) {
      print("fetchLikeList Complete");
      setLikelist(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      print("fetchLikelist Error");
      setLikelist(ApiResponse.error(error.toString()));
    });
  }
}
