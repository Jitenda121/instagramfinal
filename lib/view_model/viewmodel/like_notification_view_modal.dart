import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/like_notification_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';

class PostNotificationViewModel with ChangeNotifier {
  final _myRepo = PostNotificationRepository();

  Future<void> deleteCommentApi(dynamic data, BuildContext context) async {
    _myRepo.postNotifiaction(data).then((value) {
      Utils.toastMessage(
        'Notification successful',
      );

      // debugPrint("like user api call 2 Success");

      // Utils.flashBarErrorMessage('Notification successful', context);

      if (kDebugMode) {
        //print(value.toString());
      }
    }).onError((error, stackTrace) {
      //  setsignupLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        // debugPrint("like user api call 2 error");
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}

