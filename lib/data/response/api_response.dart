import 'package:flutter_application_1/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);
  ApiResponse.loading() : status = Status.Loading;

  ApiResponse.success(this.data) : status = Status.Success;
  ApiResponse.error(this.message) : status = Status.Error;

  @override
  String toString() {
    return "Message: $message \n message:$message \n data:$data";
  }
}
