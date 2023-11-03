import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';

class EditProfileRepository {
  final NetworkApiService _apiServices = NetworkApiService();

  Future<void> editProfileApi(dynamic data) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();

    try {
      await _apiServices.getPatchApiResponse(
        AppUrl.editProfile, // Replace with your edit profile API endpoint
        data, // Convert data to JSON
        header: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              "Bearer $authToken", // Add the authentication token here
        },
      );
    } catch (error) {
     
      debugPrint("Error during edit profile API call: $error");
      rethrow;
    }
  }
}
