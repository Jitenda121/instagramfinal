import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/like_repository.dart';
import 'package:flutter_application_1/respository/report_post_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';

class ReportPostViewModel with ChangeNotifier {
  final _myRepo = ReportPostRepository();

  Future<void> reportPostApi(dynamic data, BuildContext context) async {
    //setsignupLoading(true);
    // setLoading(true);
    //data = {"username" : "Shahid@1", "password":"Shahid@1" ,"email": "zaynkhan384@gmail.com"};
    // debugPrint("Like user api call 2");
    _myRepo.ReportPost(data).then((value) {
      Utils.toastMessage(
        'Report successful',
      );
      // Utils.toastMessage(
      //   'Report successful',
      // );
      if (kDebugMode) {}
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
      // Utils.toastMessage(r);
      //  setsignupLoading(false);

      // Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        // debugPrint("like user api call 2 error");
        //  Utils.flashBarErrorMessage(error.toString(), context);
        //print(error.toString());
      }
    });
  }
}
