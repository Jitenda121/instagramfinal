import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view/forget_password.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../respository/auth_respository.dart';
import '../../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  //final String apiUrl = "https://example.com/api/signup";
  //final String username = "socailMedia";
  //final String password = "social@123";
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signuploading = false;
  bool get signuploading => _signuploading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setsignupLoading(bool value) {
    //_setsignuploading = value;
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginapi(data).then((value) {
      setLoading(false);
      Utils.flashBarErrorMessage('login successful', context);
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.homepage, (routes) => false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setsignupLoading(true);
    //data = {"username" : "manjeet", "password":"Manj@111111" ,"email": "manjeetsachan1234@gmail.com"};
    _myRepo.signupApi(data).then((value) {
      setsignupLoading(false);
      Utils.flashBarErrorMessage('signup successful', context);
      // Navigator.pushNamed(context, RoutesName.otp,arguments: emailController.text,);
      //Navigator.pushNamed(context, RoutesName.otp(data));
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setsignupLoading(false);
      debugPrint(error.toString());
      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> verifyOtp(dynamic data, BuildContext context) async {
    setLoading(true);
    // Assume your API endpoint for OTP verification is named 'verifyOtp'
    // Modify the API call according to your backend setup
    _myRepo.verifyOtpApiforget(data).then((bool isOtpValid) {
      setLoading(false);
      if (isOtpValid) {
        Utils.flashBarErrorMessage('OTP verified successfully', context);

        Navigator.pushNamed(context, RoutesName.reset, );
      } else {
        Utils.flashBarErrorMessage('Invalid OTP. Please try again.', context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error verifying OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> forgetPassword(dynamic data, BuildContext context) async {
    setLoading(true);

    // Call your API to resend the OTP (replace 'resendOtpApi' with your actual API call)
    _myRepo.forgetPasswordApi(data).then((_) {
      setLoading(false);
      Utils.flashBarErrorMessage('OTP resent successfully', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error resending OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> resendOtp(dynamic data, BuildContext context) async {
    setLoading(true);

    // Call your API to resend the OTP (replace 'resendOtpApi' with your actual API call)
    _myRepo.resendOtpApi(data).then((_) {
      setLoading(false);
      Utils.flashBarErrorMessage('OTP resent successfully', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error resending OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
  Future<void> resetPassword(String newPassword, BuildContext context) async {
    setLoading(true);

    try {
      // Call your API to reset the password and get a token (replace 'resetPasswordApi' with your actual API call)
      String token = await _myRepo.resetPasswordApi(newPassword);

      // Store the token in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      setLoading(false);
      
      // Navigate to the home page or any other destination after resetting the password
      Navigator.pushReplacementNamed(context, RoutesName.homepage);
    } catch (error) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error resetting password: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
