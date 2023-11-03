import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/base_api_services.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/view/forget_password.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  //final  String token1=verifyOtpApi(data).toString();
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginapi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.loginapi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});

      if (response is Map<String, dynamic>) {
        // If the response is already a Map, no need to parse it
        final String accessToken = response['data']['accessToken'];
        debugPrint(response.toString());
        String userId = response['data']['user']["_id"];
        SharedPreferencesManager.saveUserId(userId);

        debugPrint("--------------------------");
        SharedPreferencesManager.saveLoginToken(accessToken);
        String? loginToken = await SharedPreferencesManager.getLoginToken();
        // debugPrint(accessToken.toString());
        debugPrint("------***************----************---------------");
        debugPrint(loginToken);

        return response;
      } else {
        throw Exception("Unexpected response type");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic header = {"NAME": "socialMedia", "PASS": "social@123"};
      dynamic response = await NetworkApiService()
          .getPostApiResponseWithHeader(AppUrl.signupapi, data);
      debugPrint(response.toString());
      return response;

      //print('')
    } catch (e) {
      rethrow;
    }
  }

  // Future<bool> verifyOtpApi(dynamic data) async {
  //   try {
  //     // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
  //     dynamic response = await _apiServices.getPostApiResponse(
  //         AppUrl.verifyOtpApi, data,
  //         header: {"Content-Type": "application/json; charset=UTF-8"});

  //     // Assuming your API response contains a key 'isValid' indicating whether the OTP is valid or not
  //     bool isValid = response['isValid'] ?? true;

  //     return isValid;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  Future<bool> verifyOtpApi(dynamic data) async {
    try {
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.verifyOtpApi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});
      debugPrint(response.toString());
      if (response['statusCode'] == 200) {
        return true;
      }

      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> verifyOtpApiforget(dynamic data) async {
    try {
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.forgetotpapi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});
      debugPrint(response.toString());
      if (response['statusCode'] == 200) {
        final String resetPasswordToken =
            response['data']['resetPasswordToken'];
        debugPrint("-----nvdonbvoidsobijjbo---------------");
        debugPrint('Reset Password Token: $resetPasswordToken');
        SharedPreferencesManager.saveResetPasswordToken(resetPasswordToken);
        String resetToken =
            (await SharedPreferencesManager.getResetPasswordToken())!;
        // debugPrint(accessToken.toString());
        debugPrint("------***************----************---------------");
        debugPrint(resetToken);

        return true;
      }

      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgetPasswordApi(dynamic data) async {
    // Replace 'AppUrl.resendOtpApi' with your actual OTP resend API endpoint
    await _apiServices.getPostApiResponse(AppUrl.forgetpassword, data,
        header: {"Content-Type": "application/json; charset=UTF-8"});
  }

  Future<void> resendOtpApi(dynamic data) async {
    // Replace 'AppUrl.resendOtpApi' with your actual OTP resend API endpoint
    await _apiServices.getPostApiResponse(AppUrl.resendOtpApi, data,
        header: {"Content-Type": "application/json; charset=UTF-8"});
  }

  Future<dynamic> resetPasswordApi(
    dynamic data,
  ) async {
    String? authToken = await SharedPreferencesManager.getResetPasswordToken();
    debugPrint("@@@@@@@@@@@@@@@@@@@@@@@!&&&&&&&&&&&&&&&&&&&&&&&&");
    debugPrint(authToken.toString());
    debugPrint("dfghjkldfghjkcvhbjkffghjkcfghj");
    debugPrint("Requesting password reset API with token: $authToken");
    debugPrint("Request Data: $data");
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.resetpasswordapi,
        data,
        header: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer $authToken",
        },
      );
    } catch (e) {
      print(Response);
      debugPrint("Error during API call: $e");
      rethrow;
    }
  }

  Future<void> toggleLikeApi(String postId) async {
    try {
      debugPrint("#####################");
      dynamic response = await _apiServices.getPostApiResponse(
        '${AppUrl.postlike}/$postId', // Adjust the endpoint URL
        null, // You might need to send additional data here, if required
        header: {
          "Content-Type": "application/json; charset=UTF-8",
          //"Authorization": "Bearer $authToken", // Add the authentication token here
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutApi(String? authToken) async {
    if (authToken == null) {
      print("No authToken found.");
      return;
    }

    try {
      // ...
    } catch (error) {
      // ...
    }
  }

  Future<void> createPostApi(dynamic data) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();

    try {
      debugPrint("--------------@@@@@@@@@@@@@@@@---------");
      debugPrint(authToken);
      // Send a POST request to the create post API endpoint
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.createpost, // Replace with your create post API endpoint
        data, // Convert data to JSON
        header: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              "Bearer $authToken", // Add the authentication token here
        },
      );

      // Handle the response as needed (parsing, error handling, etc.)
      debugPrint("Create Post API Response: $response");
    } catch (error) {
      // Handle error if needed
      print("Error during create post API call: $error");
      rethrow;
    }
  }

  Future<void> deleteUserPostApi(String postId) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();
    debugPrint(authToken.toString());
    debugPrint("dfhgjklfhgjkhjghgjkhgcvjhvgvbb");
    debugPrint(postId.toString());
    debugPrint("dxfgchjgk");

    try {
      // Send a DELETE request to the delete user post API endpoint
      await _apiServices.getDeleteApiResponse(
        '${AppUrl.deleteUserPost}?postId=$postId', // Adjust the endpoint URL with postId
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

  Future<void> ReportPostApi(String postId) async {
    String? authToken = await SharedPreferencesManager.getLoginToken();
    debugPrint(authToken.toString());
    debugPrint("dfhgjklfhgjkhjghgjkhgcvjhvgvbb");
    debugPrint(postId.toString());
    debugPrint("dxfgchjgk");

    try {
      // Send a DELETE request to the delete user post API endpoint
      await _apiServices.getDeleteApiResponse(
        '${AppUrl.deleteUserPost}?postId=$postId', // Adjust the endpoint URL with postId
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
