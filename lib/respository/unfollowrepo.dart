import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';


class UnFollowersRepository {
  final NetworkApiService _apiServices = NetworkApiService();
  Future<void> unfollowUsertApi(String followingId) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();
    debugPrint(authToken.toString());
    debugPrint(followingId.toString());

    try {
      // Send a DELETE request to the delete user post API endpoint
      await _apiServices.getDeleteApiResponse(
        '${AppUrl.unfollowUser}?followingId=$followingId', // Adjust the endpoint URL with postId
        header: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "$authToken",
        },
      );
    } catch (error) {
      // Handle error if needed
      debugPrint(error.toString());
      debugPrint("Error during delete user post API call: $error");
      rethrow;
    }
  }
}