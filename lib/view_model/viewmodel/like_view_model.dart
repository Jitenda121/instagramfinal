import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/like_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';


class LikePostViewModel with ChangeNotifier {
  final _myRepo = LikePostRepository();

  Future<void> LikePostApi(dynamic data, BuildContext context) async {
    //setsignupLoading(true);
    // setLoading(true);
    //data = {"username" : "Shahid@1", "password":"Shahid@1" ,"email": "zaynkhan384@gmail.com"};
       debugPrint("Like user api call 2");
    _myRepo.LikePost(data).then((value) {
       debugPrint("like user api call 2 Success");

      Utils.flashBarErrorMessage('like  successful', context);

      if (kDebugMode) {
        //print(value.toString());
      }
    }).onError((error, stackTrace) {
      //  setsignupLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
         debugPrint("like user api call 2 error");
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}