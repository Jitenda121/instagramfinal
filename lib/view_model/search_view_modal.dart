import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/SearchModal.dart';
import 'package:flutter_application_1/respository/search_repository.dart';

class SearchUserViewModel with ChangeNotifier {
  final _myRepo = SearchUserRepository();
  ApiResponse<SearchUser> searchUser = ApiResponse.loading();
  setUserProfile(ApiResponse<SearchUser> response) {
    searchUser = response;
    notifyListeners();
  }

  Future<void> SeachUserProfile(String name) async {
    setUserProfile(ApiResponse.loading());
    _myRepo.getUserProfileApi(name).then((value) {
      setUserProfile(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      setUserProfile(ApiResponse.error(error.toString()));
    });
  }
}
