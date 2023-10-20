import 'dart:convert';
//import 'dart:js';
//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/base_api_services.dart';
import 'package:flutter_application_1/data/network/network_services.dart';
import 'package:flutter_application_1/res/component/app_url.dart';
import 'package:flutter_application_1/view/forget_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  //final  String token1=verifyOtpApi(data).toString();
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginapi(dynamic data) async {
    try {
      // dynamic header=
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.loginapi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});
      debugPrint("@@@@@@@@@@@@@@@@@@");
      if (response is String) {
        // If the response is a JSON string, parse it
        Map<String, dynamic> parsedResponse = json.decode(response);
        debugPrint(parsedResponse.toString());
        return parsedResponse;
      } else if (response is Map<String, dynamic>) {
        // If the response is already a Map, no need to parse it
        debugPrint(response.toString());
        return response;
      } else {
        // Handle other response types if necessary
        throw Exception("Unexpected response type");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic header = {"NAME": "socailMedia", "PASS": "social@123"};
      dynamic response = await NetworkApiService()
          .getPostApiResponseWithHeader(AppUrl.signupapi, data);
      debugPrint(response.toString());
      return response;

      //print('')
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> verifyOtpApi(dynamic data) async {
    try {
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.verifyOtpApi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});

      // Assuming your API response contains a key 'isValid' indicating whether the OTP is valid or not
      bool isValid = response['isValid'] ?? true;

      return isValid;
    } catch (e) {
      // Handle errors here, such as network issues or server errors
      // You can log the error or throw it back to the calling function
      rethrow;
    }
  }

  Future<bool> verifyOtpApiforget(dynamic data) async {
    try {
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.forgetotpapi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});

      // Assuming your API response contains a key 'isValid' indicating whether the OTP is valid or not
      bool isValid = response['isValid'] ?? true;
      debugPrint("%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

      String token = response["data"]["resetPasswordToken"];
      //Navigator.push(context,MaterialPageRoute(builder: (context)=>))
      // Navigator.push(context,MaterialPageRoute(builder:(context)=>))

      print(token);

      return isValid;
    } catch (e) {
      // Handle errors here, such as network issues or server errors
      // You can log the error or throw it back to the calling function
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

  Future<String> resetPasswordApi(String newPassword) async {
    try {
      // Replace 'AppUrl.resetPasswordApi' with your actual reset password API endpoint
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.resetpasswordapi,
        {"newPassword": newPassword},
        header: {"Content-Type": "application/json; charset=UTF-8"},
      );

      // Assuming your API response contains a key 'token' indicating the new token after password reset
      String token = response['token'];
      debugPrint("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      debugPrint(response.toString());

      // Store the new token in SharedPreferences for future use
      await _storeToken(token);

      return token;
    } catch (e) {
      // Handle errors here, such as network issues or server errors
      // You can log the error or throw it back to the calling function
      rethrow;
    }
  }

  Future<void> _storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
