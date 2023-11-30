import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';
//import 'package:flutter_application_1/view/bottommodalsheet/bottommodalsheet.dart';
import 'package:flutter_application_1/view_model/viewmodel/comment_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/like_notification_view_modal.dart';

class YourBottomSheetWidget extends StatefulWidget {
  final String postId;
  final String targetUser;
  final Function(bool) onCommentPosted;

  const YourBottomSheetWidget(
      {super.key,
      required this.postId,
      required this.targetUser,
      required this.onCommentPosted});
  @override
  State<YourBottomSheetWidget> createState() => _YourBottomSheetWidgetState();
}

String? userId;
void getUserIdFromSharedPreferences() async {
  userId = await SharedPreferencesManager.getUSerId();
}

class _YourBottomSheetWidgetState extends State<YourBottomSheetWidget> {
  CommentViewModel commentViewModel = CommentViewModel();
  PostNotificationViewModel postNotificationViewModel =
      PostNotificationViewModel();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    debugPrint("in homepage");

    getUserIdFromSharedPreferences();
    super.initState();
  }

  String? userId;
  void getUserIdFromSharedPreferences() async {
    userId = await SharedPreferencesManager.getUSerId();
  }

  @override
  Widget build(BuildContext context) {
    double halfScreenHeight = MediaQuery.of(context).size.height * 0.5;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: halfScreenHeight,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Comment', // Customize this text as per your requirement
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText:
                      'Write your comment...', // Placeholder text inside the TextField
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String comment = _commentController.text.toString();
                  // Process the comment (e.g., send it to an API, save it, etc.)
                 // print('Comment: $comment');
                  Map map = {"comment": comment, "postId": widget.postId};
                  bool success =
                      await commentViewModel.commentPostApi(map, context);
                  Map data = {
                    "receiverId": widget.targetUser.toString(),
                    "activityId": widget.postId,
                    "type": "COMMENT"
                  };

                  // ignore: non_constant_identifier_names
                  String? Id = await SharedPreferencesManager.getUSerId();
                  if (Id != data["receiverId"]) {
                 // ignore: use_build_context_synchronously
                 await postNotificationViewModel.deleteCommentApi(data, context);
                  }
                  // postNotificationViewModel.deleteCommentApi(data, context);
                  if (success) {
                    widget.onCommentPosted(success);
                  }

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);

                  // Close the bottom modal sheet
                },
                child: const Center(
                  child: Text('Send'),
                ), // Customize the button text as per your requirement
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController
        .dispose(); // Dispose the controller when the widget is removed from the tree
    super.dispose();
  }
}
