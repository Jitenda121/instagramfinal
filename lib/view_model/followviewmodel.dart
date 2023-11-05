import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/followersuserrepo.dart';
import 'package:flutter_application_1/utils/utils.dart';


class FollowUserViewModel with ChangeNotifier {
  final _myRepo = FollowerUserRepository();

  Future<void> followUserApi(dynamic data, BuildContext context) async {
    //setsignupLoading(true);
    // setLoading(true);
    //data = {"username" : "Shahid@1", "password":"Shahid@1" ,"email": "zaynkhan384@gmail.com"};
    debugPrint("follow user api call 2");
    _myRepo.followUser(data).then((value) {
      debugPrint("follow user api call 2 Success");
      //  setsignupLoading(false);
      //setLoading(false);
      Utils.flashBarErrorMessage('follow successful', context);
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => OTP(userData: email)));

      // debugPrint(value.toString());

      // Navigator.pushNamed(context, RoutesName.otp);
      if (kDebugMode) {
        //print(value.toString());
      }
    }).onError((error, stackTrace) {
      //  setsignupLoading(false);

      // Utils.flashBarErrorMessage(error.toString(), context);
      // if (kDebugMode) {
      //    debugPrint("follow user api call 2 error");
      //   Utils.flashBarErrorMessage(error.toString(), context);
      //   print(error.toString());
      // }
    });
  }
}