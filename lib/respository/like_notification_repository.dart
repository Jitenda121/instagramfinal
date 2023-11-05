

import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class PostNotificationRepository {
  final NetworkApiService _apiServices = NetworkApiService();

  // Return the like count
  Future<void> postNotifiaction(dynamic data) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();
    try {
      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken"
      };
      String url = "${AppUrl.postNotification}";
      dynamic response = await _apiServices.PostCommentApiResponse(url,data, header);

      // Extract the new like count from the response (modify this part)
    } catch (e) {
      rethrow;
    }
  }
}

