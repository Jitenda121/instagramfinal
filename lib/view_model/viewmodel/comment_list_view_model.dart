import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/api_response.dart';
import 'package:flutter_application_1/model/commentList.dart';
import 'package:flutter_application_1/model/likeList.dart';
import 'package:flutter_application_1/model/show_followers.dart';
import 'package:flutter_application_1/respository/commentList_repo.dart';
import 'package:flutter_application_1/respository/comment_repository.dart';
import 'package:flutter_application_1/respository/likeList_repository.dart';
import 'package:flutter_application_1/respository/user_follower_reposotory.dart';

class CommentlistViewModel with ChangeNotifier {
  final _myRepo = CommentlistRepository();
  ApiResponse<CommentList> listList = ApiResponse.loading();
  setLikelist(ApiResponse<CommentList> response) {
    listList = response;
    notifyListeners();
  }

  Future<void> fetchCommentlist(String postId) async {
    print("fetchCommentlist");
    setLikelist(ApiResponse.loading());
    _myRepo.getCommentlistApi(postId).then((value) {
      print("fetchCommentList Complete");
      setLikelist(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      print("fetchCommentlist Error");
      setLikelist(ApiResponse.error(error.toString()));
    });
  }
}
