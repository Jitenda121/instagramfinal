import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/edit_comment_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';

class EditCommentViewModel with ChangeNotifier {
  final _myRepo = EditCommentRepository();

  Future<void> editCommentApi(dynamic postId, dynamic commentId, dynamic data,
      BuildContext context) async {
    _myRepo.editComment(postId, commentId, data).then((value) {
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
