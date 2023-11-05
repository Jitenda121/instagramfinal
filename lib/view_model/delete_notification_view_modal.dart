import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/delete_notification_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';


class DeleteNotificationtViewModel with ChangeNotifier {
  final _myRepo = DeleteNotificationRepository();

  Future<void> deleteNotificationtApi(
      dynamic data, BuildContext context) async {
    debugPrint("delete notification api call 2");
    _myRepo.DeleteNotification(data).then((value) {
      debugPrint("delete notification api call 2 Success");

      Utils.toastMessage('delete notification  successful');

      if (kDebugMode) {}
    }).onError((error, stackTrace) {
      //  setsignupLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        debugPrint("delete notification api call 2 error");
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}

