import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/app_exception.dart';
import 'package:flutter_application_1/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  Future<dynamic> getGetApiResponse1(String url, dynamic header) async {
    dynamic responseJson;

    try {
      final response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
      //debugPrint("dgfhjklcvbnmbcvbn");
      debugPrint(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getDeleteApiResponse(String url, {Map<String, String>? header}) async {
    dynamic responseJson;

    try {
      final response = await http
          .delete(
            Uri.parse(url),
            headers: header,
          )
          .timeout(Duration(seconds: 10));
      debugPrint(response.toString());

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data,
      {Map<String, String>? header}) async {
    dynamic responseJson;

    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(data),
            headers: header,
          )
          .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  Future getPostApiResponseWithHeader(
    String url,
    dynamic data,
  ) async {
    dynamic responseJson;

    try {
      final response =
          await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
        'Authorization': 'Basic c29jaWFsTWVkaWE6c29jaWFsQDEyMw==',
        'Content-Type': 'application/json; charset=UTF-8'
      }).timeout(Duration(seconds: 10));
      debugPrint("API Call Success ${response.statusCode}");
      responseJson = returnResponse(response);
      debugPrint("API Call Success ${responseJson}");
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    final responseJson = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 400:
        debugPrint(responseJson.toString());
        throw BadRequestException(responseJson['error'] ?? 'Bad Request');
      case 401:
        debugPrint("-----------------@@@@@@@@@@@@@@-------------");
        debugPrint(responseJson.toString());
        // debugPrint();
        throw UnauthorisedException(responseJson['error'] ?? 'Unauthorized');
      case 404:
        throw NotFoundException(responseJson['error'] ?? 'NotFoundException');

      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with status code ${response.toString()}');
    }
  }
}
