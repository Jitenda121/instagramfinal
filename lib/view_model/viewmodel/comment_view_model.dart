import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/comment_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';

class CommentViewModel with ChangeNotifier {
  final _myRepo = CommentPostRepository();

  Future<bool> commentPostApi(dynamic data, BuildContext context) async {
    try {
      await _myRepo.CommentPost(data);
      Utils.toastMessage('Comment successful');
      return true; // Return true to indicate success
    } catch (error) {
      // ignore: use_build_context_synchronously
      Utils.flashBarErrorMessage(error.toString(), context);
      return false; // Return false to indicate failure
    }
  }
}

