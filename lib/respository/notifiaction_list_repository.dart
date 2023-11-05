
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/model/notificationList.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class NotificationlistRepository {
  final NetworkApiService _apiServices = NetworkApiService();

// **************************** GET NOTIFICATION LIST API *******************************
  Future<NotificationListModal> getNotificationlistApi() async {
    try {
      String? authToken = await SharedPreferencesManager.getLoginToken();
      // String? userId = await SharedPreferencesManager.getUSerId();

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.getnotificationList}";
      dynamic response = await _apiServices.getGetApiResponse3(url, header);
      return response = NotificationListModal.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}