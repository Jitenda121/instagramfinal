import 'package:flutter/material.dart';

class YourBottomSheetWidget extends StatefulWidget {
  @override
  State<YourBottomSheetWidget> createState() => _YourBottomSheetWidgetState();
}

class _YourBottomSheetWidgetState extends State<YourBottomSheetWidget> {
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
                  String comment = _commentController.text;
                  // Process the comment (e.g., send it to an API, save it, etc.)
                  print('Comment: $comment');
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
