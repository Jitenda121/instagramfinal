import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/editprofilerepo.dart';
import 'package:flutter_application_1/utils/utils.dart';
// import 'package:instragram_clone/respository/edit_post_repository.dart';
// import 'package:instragram_clone/utils/toastMessage.dart';

class EditPostViewModel with ChangeNotifier {
  final _myRepo = EditPostRepository();

  Future<void> editpostApi(dynamic postId, dynamic data,
      BuildContext context) async {
    _myRepo.editPost(postId, data).then((value) {
      Utils.toastMessage(
        'Edit successful',
      );

      // debugPrint("like user api call 2 Success");

      Utils.toastMessage(
        'Edit successful',
      );

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