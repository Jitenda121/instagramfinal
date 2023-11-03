import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_model/viewmodel/comment_view_model.dart';

class YourBottomSheetWidget extends StatefulWidget {
  final String postId;

  const YourBottomSheetWidget({super.key, required this.postId});
  @override
  State<YourBottomSheetWidget> createState() => _YourBottomSheetWidgetState();
}

class _YourBottomSheetWidgetState extends State<YourBottomSheetWidget> {
  CommentViewModel commentViewModel = CommentViewModel();
  TextEditingController _commentController = TextEditingController();

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
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Comment', // Customize this text as per your requirement
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText:
                      'Write your comment...', // Placeholder text inside the TextField
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String comment = _commentController.text.toString();
                  // Process the comment (e.g., send it to an API, save it, etc.)
                  print('Comment: $comment');
                  Map map = {"comment": comment, "postId": widget.postId};
                  commentViewModel.commentPostApi(map, context);
                  Navigator.pop(context); // Close the bottom modal sheet
                },
                child: Center(
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
