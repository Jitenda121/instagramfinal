import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view/otp_screen.dart';
import '../../respository/auth_respository.dart';
import '../../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
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

  Future<void> loginApi(dynamic data, context) async {
    setLoading(true);
    _myRepo.loginapi(data).then((value) {
      setLoading(false);
      Utils.toastMessage(
        'login successful',
      );
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.homepage, (routes) => false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(
        error.toString(),
      );
      if (kDebugMode) {
        Utils.toastMessage(
          error.toString(),
        );
        print(error.toString());
      }
    });
  }

  Future<void> signupApi(
      dynamic data, String email, BuildContext context) async {
    setsignupLoading(true);
    //data = {"username" : "manjeet", "password":"Manj@111111" ,"email": "manjeetsachan1234@gmail.com"};
    _myRepo.signupApi(data).then((value) {
      setsignupLoading(false);
      Utils.toastMessage(
        'signup successful',
      );
      // Navigator.pushNamed(context, RoutesName.otp,arguments: emailController.text,);
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => OTP(userEmail: email))));
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

        Navigator.pushNamed(context, RoutesName.reset);
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

  Future<void> verifyOtp1(dynamic data, BuildContext context) async {
    setLoading(true);
    // Assume your API endpoint for OTP verification is named 'verifyOtp'
    // Modify the API call according to your backend setup
    _myRepo.verifyOtpApi(data).then((bool isOtpValid) {
      setLoading(false);
      if (isOtpValid) {
        Utils.flashBarErrorMessage('OTP verified successfully', context);

        Navigator.pushNamed(context, RoutesName.login);
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
      Utils.flashBarErrorMessage('OTP sent successfully', context);
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
      Utils.flashBarErrorMessage('OTP resend successfully', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error resending OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> resendOtp1(dynamic data, BuildContext context) async {
    setLoading(true);

    // Call your API to resend the OTP (replace 'resendOtpApi' with your actual API call)
    _myRepo.resendOtpApi(data).then((_) {
      setLoading(false);
      Utils.flashBarErrorMessage('OTP resend successfully', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error resending OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> resetPassword(dynamic data, BuildContext context) async {
    setLoading(true);
    debugPrint("fdghjkljgfgc");
    debugPrint(data.toString());

    try {
      _myRepo.resetPasswordApi(data).then((_) {
        setLoading(false);
        Utils.flashBarErrorMessage('Password reset successful', context);
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (routes) => false);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.flashBarErrorMessage('Error resetting password: $error', context);
        if (kDebugMode) {
          print(error.toString());
        }
      });
    } catch (error) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error obtaining authToken: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> postLike(String postId, BuildContext context) async {
    setLoading(true);
    debugPrint("@#@@@@@@@@@@@@@@@?***********");

    debugPrint(postId.toString());

    try {
      await _myRepo.toggleLikeApi(postId);

      setLoading(false);

      notifyListeners();
    } catch (error) {
      setLoading(false);
      Utils.toastMessage('Error liking post: $error');
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    // Retrieve the authentication token from shared preferences.
    String? authToken = await SharedPreferencesManager.getLoginToken();

    // Set loading state to indicate the logout process has started.
    setLoading(true);

    try {
      debugPrint(
          "------------------------------authToken1--------------------------");
      String? s2 = await SharedPreferencesManager.getLoginToken();
      debugPrint(s2);
      // Delete the token from shared preferences first.
      SharedPreferencesManager.deleteLoginToken();

      // Now, perform the logout action (if any).
      await _myRepo.logoutApi(authToken);

      // At this point, 'authToken' should be deleted, and any debugPrint will show it as null.
      debugPrint(
          "------------------------------authToken2--------------------------");
      String? s1 = await SharedPreferencesManager.getLoginToken();
      debugPrint(s1);

      // Navigate to the login screen after successful logout.
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.login, (routes) => false);

      // Set loading state to indicate the logout process is complete.
      setLoading(false);
    } catch (error) {
      // If there's an error during logout, handle it and display an error message.
      setLoading(false);
      // ignore: use_build_context_synchronously
      Utils.flashBarErrorMessage('Error during logout: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> createPost(dynamic data, context) async {
    setLoading(true);

    try {
      // Call your API endpoint to create a new post (replace 'createPostApi' with your actual API endpoint)
      await _myRepo.createPostApi(data);
      Utils.toastMessage("post successful");
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.homepage, (routes) => false);

      // Perform any necessary actions after the post is successfully created
      //For example, navigate to the home page
      // Navigator.pushNamedAndRemoveUntil(
      //     context, RoutesName.homepage, (routes) => false);
      //Navigator.pushNamed(BuildContext,r)
      // Navigator.pushNamed( BuildContext context,RoutesName.homepage)

      setLoading(false);
    } catch (error) {
      setLoading(false);
      Utils.toastMessage('Error creating post: $error');
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> deletePost(dynamic data, BuildContext context) async {
    setLoading(true);

    try {
      // Call your API endpoint to delete the post using postId
      String postId = data['postId'];
      debugPrint("@@@@@@@@@@@@@@@@@@@@@@@");
      debugPrint(postId.toString());

      // Check if postId is not null or empty before making the API call
      if (postId.isNotEmpty) {
        // Call the API with the postId parameter
        // debugPrint(postId.toString());
        // debugprint
        await _myRepo.deleteUserPostApi(postId);

        Utils.toastMessage("Post deleted successfully");

        // Perform any necessary actions after the post is successfully deleted
        // For example, refresh the feed or navigate to a different screen
        // Navigator.pushNamedAndRemoveUntil(
        //     context, RoutesName.homepage, (routes) => false);
      } else {
        // Handle the case where postId is null or empty
        Utils.flashBarErrorMessage('postId is required', context);
      }

      setLoading(false);
    } catch (error) {
      setLoading(false);
      debugPrint("Error during delete user post API call: $error");
    }
  }
  // Future<void> ReportPost(dynamic data, BuildContext context) async {
  //   setLoading(true);

  //   try {
  //     // Call your API endpoint to delete the post using postId
  //     String postId = data['postId'];
  //     debugPrint("@@@@@@@@@@@@@@@@@@@@@@@");
  //     debugPrint(postId.toString());

  //     // Check if postId is not null or empty before making the API call
  //     if (postId.isNotEmpty) {
  //       // Call the API with the postId parameter
  //      // debugPrint(postId.toString());
  //       // debugprint
  //       await _myRepo.ReportPostApi(postId);

  //       Utils.toastMessage("Post deleted successfully");

  //       // Perform any necessary actions after the post is successfully deleted
  //       // For example, refresh the feed or navigate to a different screen
  //       // Navigator.pushNamedAndRemoveUntil(
  //       //     context, RoutesName.homepage, (routes) => false);
  //     } else {
  //       // Handle the case where postId is null or empty
  //       Utils.flashBarErrorMessage('postId is required', context);
  //     }

  //     setLoading(false);
  //   } catch (error) {
  //     setLoading(false);
  //     debugPrint("Error during delete user post API call: $error");
  //   }
  // }
}
