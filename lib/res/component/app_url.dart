class AppUrl {
  static var baseUrl = "https://pranavsocial.appskeeper.in";
  // static var commonPathUrl = "v1/pc-common/";
  // static var loginEndPoint =  "${commonPathUrl}login";
  // static var forgetPinEndPoint ="v1/pc-common/forgot-pin";a
  // static var taskListEndPoint ="v1/tasks";
  // static var notificationListEndPoint ="v1/parent-child/notification";
  // static var forgetOtpVerifyEndPoint ="${commonPathUrl}verify-forgot-otp";
  // static var resetPinEndPoint ="${commonPathUrl}reset-pin";
  //static var loginUrl = baseUrl + loginEndpoint;
  // static var forgetPinUrl = baseUrl + forgetPinEndPoint;
  // static var forgetOtpVerifyUrl = baseUrl + forgetOtpVerifyEndPoint;
  // static var resetPinUrl = baseUrl + resetPinEndPoint;
  // static var notificationList = baseUrl + notificationListEndPoint;
  // static var taskList = baseUrl + taskListEndPoint;
  static var loginapi = '$baseUrl/api/v1/user/login';
  static var signupapi = '$baseUrl/api/v1/user/signup';
  static var verifyOtpApi = '$baseUrl/api/v1/user/verifyUser';
  static var resendOtpApi = '$baseUrl/api/v1/user/send-otp';
  static var forgetpassword = '$baseUrl/api/v1/user/forgot-password';
  static var forgetotpapi = '$baseUrl/api/v1/user/verifyOTP';
  static var resetpasswordapi = '$baseUrl/api/v1/user/reset-password';
  
  
}
