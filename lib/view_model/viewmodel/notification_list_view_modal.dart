import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/notificationList.dart';
import 'package:flutter_application_1/respository/notifiaction_list_repository.dart';


class NotificationlistViewModel with ChangeNotifier {
  final _myRepo = NotificationlistRepository();
  ApiResponse<NotificationListModal> listList = ApiResponse.loading();
  setNotificationlist(ApiResponse<NotificationListModal> response) {
    listList = response;
    notifyListeners();
  }

  Future<void> fetchNotificationlist() async {
   //print("fetchNotificationlist");
    setNotificationlist(ApiResponse.loading());
    _myRepo.getNotificationlistApi().then((value) {
     // print("fetchNotificationlist Complete");
      setNotificationlist(ApiResponse.success(value));
    }).onError((error, stackTrace) {
     // print("fetchNotificationlist Error");
      setNotificationlist(ApiResponse.error(error.toString()));
    });
  }
}