import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/delete_comment_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';


class DeleteCommentViewModel with ChangeNotifier {
  final _myRepo = DeleteCommentRepository();

  Future<void> deleteCommentApi(dynamic postId,dynamic commentId ,BuildContext context) async {
    _myRepo.deleteComment(postId,commentId).then((value) {
      Utils.toastMessage(
        'Report successful',
      );

      // debugPrint("like user api call 2 Success");

      Utils.toastMessage(
        'Report successful',
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

