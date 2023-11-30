import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/SearchModal.dart';
import 'package:flutter_application_1/respository/search_repository.dart';

class SearchUserViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myRepo = SearchUserRepository();
  ApiResponse<SearchUser> searchUser = ApiResponse.loading();
   setUserProfile(ApiResponse<SearchUser> response) {
    searchUser = response;
    notifyListeners();
  }

  Future<void> SeachUserProfile(String name) async {
    setLoading(true);
    setUserProfile(ApiResponse.loading());
    _myRepo.getUserProfileApi(name).then((value) {
      setLoading(false);
      setUserProfile(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      setLoading(false);
      setUserProfile(ApiResponse.error(error.toString()));
    });
  }
}



