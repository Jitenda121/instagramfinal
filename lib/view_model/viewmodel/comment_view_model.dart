import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/comment_repository.dart';
import 'package:flutter_application_1/respository/like_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';


class CommentViewModel with ChangeNotifier {
  final _myRepo = CommentPostRepository();

  Future<void> commentPostApi(dynamic data, BuildContext context) async {
    //setsignupLoading(true);
    // setLoading(true);
    //data = {"username" : "Shahid@1", "password":"Shahid@1" ,"email": "zaynkhan384@gmail.com"};
       debugPrint("Comment api call 2");
    _myRepo.CommentPost(data).then((value) {
       debugPrint("Comment api call 2 Success");

      Utils.flashBarErrorMessage('Comment successful', context);

      if (kDebugMode) {
        //print(value.toString());
      }
    }).onError((error, stackTrace) {
      //  setsignupLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
         debugPrint("Comment api call 2 error");
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}