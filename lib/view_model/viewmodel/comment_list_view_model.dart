import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/commentList.dart';
import 'package:flutter_application_1/respository/commentList_repo.dart';

class CommentlistViewModel with ChangeNotifier {
  final _myRepo = CommentlistRepository();
  ApiResponse<CommentList> listList = ApiResponse.loading();
  setLikelist(ApiResponse<CommentList> response) {
    listList = response;
    notifyListeners();
  }

  int commentCount = 0;
  Future<void> fetchCommentlist(String postId) async {
    // print("fetchCommentlist");
    setLikelist(ApiResponse.loading());
    _myRepo.getCommentlistApi(postId).then((value) {
      commentCount = value.data.comments.length;
      // print("fetchCommentList Complete");
      setLikelist(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      // print("fetchCommentlist Error");
      setLikelist(ApiResponse.error(error.toString()));
    });
  }
}
