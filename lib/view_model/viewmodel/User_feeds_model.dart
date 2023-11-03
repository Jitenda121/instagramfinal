import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/User_feeds.dart';
import 'package:flutter_application_1/respository/User_feeds_repository.dart';

class UserFeedsViewModel with ChangeNotifier {
  final _myRepo = UserFeedsRepository();
  ApiResponse<UserFeeds> userFeeds = ApiResponse.loading();
  setUserfeed(ApiResponse<UserFeeds> response) {
    userFeeds = response;
    notifyListeners();
  }

  Future<void> fetchUserfeeds() async {
    setUserfeed(ApiResponse.loading());
    debugPrint("in Fetch feeds");
    _myRepo.getUserfeeds().then((value) {
      setUserfeed(ApiResponse.success(value));
      debugPrint(value.toString());
    }).onError((error, stackTrace) {
      debugPrint("in Fetch feeds on Error");
      debugPrint(error.toString());
      setUserfeed(ApiResponse.error(error.toString()));
    });
  }
}
