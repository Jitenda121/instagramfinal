//import 'package:edfundo_flutter_demo/data/db/share_preferance_helper.dart';
//import 'package:edfundo_flutter_demo/repo/forget_pin_repo/forget_pin_repo.dart';
//import 'package:edfundo_flutter_demo/res/route/route_name.dart';
//import 'package:edfundo_flutter_demo/screen/auth/login/login_screen.dart';
//import 'package:edfundo_flutter_demo/screen/otp_screen/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../data/response/api_response.dart';
//import '../../model/response/forget_pin_response.dart';
//import '../../utils/util.dart';

class ForgetPinViewModel  with ChangeNotifier{

  //final _forgetPinRepo = ForgetPinRepository();
  //final sharePre       =SharedPreferencesHelper();

  // ApiResponse<ForgetPinResponse> forgetPin = ApiResponse.loading();
  // setForgetPin(ApiResponse<ForgetPinResponse> response){
  //   forgetPin = response ;
  //   notifyListeners();
  // }
  
  // _saveAccessToken(String accessToken){
  //   sharePre.setString("accessToken", accessToken);
  // }

//  String _getAccessToken(){
//     return sharePre.getString("accessToken", defaultValue:"");
//  }

  // Map<String, String> _headerDataRequest() {
  //   Map<String, String> data = {
  //     "platform":"1",
  //     "timezone":"0",
  //     "authorization":"Basic RWRmdW5iMF9xcjBidUN0MTBuX0BwcDpoV1c4dENuQFFXUWZ1OUs2MXNkN2dZcSYyREY0LWZ2Wmh5I1hjTkpHeXVNU19udFRiMg=="
  //   };
  //   return data;
  // }

  // Future<void> forgetPinApi(dynamic data , BuildContext context) async{
  //   setForgetPin(ApiResponse.loading());
  //   _forgetPinRepo.forgetPinApi(data,_headerDataRequest()).then((value){
  //    _saveAccessToken(value['data']['accessToken']);
  //     Navigator.pushReplacementNamed(context, RoutesName.otpScreen);
  //   }
  //   ).onError((error, stackTrace){
  //     setForgetPin(ApiResponse.error(error.toString()));
  //     Utils.flashBarErrorMessage(error.toString(), context);
  //   });
  // }
// Future<void> verifyOtpAPi(dynamic data , BuildContext context) async {
//    _forgetPinRepo.verifyOtpApi(data, _headerDataRequest()).then((value){
//      Navigator.pushReplacementNamed(context, RoutesName.setPinScreen);
//    }).onError((error, stackTrace){
//       Utils.toastMessage("OTP is invalid.");
//    });
// }
// Future<void> resetPinApi(dynamic data ,BuildContext context) async{
//  _forgetPinRepo.resetPinApi(data,_headerDataRequest()).then((value){
//    print(value);
//    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>  LoginScreen()), (route) => false);
//    Utils.toastMessage("Passcode Change Successfully");
//  }).onError((error, stackTrace) {
//    print(error.toString());
//    Utils.toastMessage(error.toString());
//  });
// }

}