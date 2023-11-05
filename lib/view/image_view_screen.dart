import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/res/colors.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/view_model/edit_view_model.dart';
import 'package:flutter_application_1/view_model/getgetuserprofileviewmodel.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class ImageViewScreen extends StatefulWidget {
  final String imageUrl;
  final String postId;

  const ImageViewScreen({
    super.key,
    required this.imageUrl,
    required this.postId,
  });

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  GetUserProfileViewModel getUserProfileViewModel = GetUserProfileViewModel();
  EditPostViewModel editPostViewModel = EditPostViewModel();

  TextEditingController captionController = TextEditingController();
  bool isEditingCaption = false;

  @override
  void initState() {
    super.initState();
    getUserProfileViewModel.fetchUserProfile(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.applelogin,
        title: Text('Image View'),
      ),
      body: ChangeNotifierProvider<GetUserProfileViewModel>(
        create: (BuildContext context) => getUserProfileViewModel,
        child: Consumer<GetUserProfileViewModel>(
          builder: (context, value, _) {
            switch (value.getUserPost.status) {
              case Status.Loading:
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );

              case Status.Error:
                return Text("No result found");

              case Status.Success:
                return Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      // User profile information
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
Text(
                              "Edit caption",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.applelogin,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isEditingCaption = true;
                                  captionController.text = value
                                      .getUserPost.data!.data.posts[0].caption;
                                });
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),

                      // Image
                      Stack(
                        children: [
                          Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            height: 300,
                          ),
                        ],
                      ),

                      // Caption
                      if (isEditingCaption)
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: captionController,
                                  decoration: InputDecoration(
                                    hintText: "Edit caption...",
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Save the edited caption
                                  // You can add the logic here to save the caption
                                  Map data = {
                                    "caption": captionController.text.toString()
                                  };
                                  editPostViewModel.editpostApi(
                                      value.getUserPost.data!.data.posts[0].id
                                          .toString(),
                                      data,
                                      context);
                                  setState(() {
                                    isEditingCaption = false;
                                  });
                                  getUserProfileViewModel
                                      .fetchUserProfile(widget.postId);
                                },
                                icon: Icon(Icons.save),
                              ),
                            ],
                          ),
                        )
else
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            "Caption: ${value.getUserPost.data!.data.posts[0].caption}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      // Like and Comment Counts
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite, color: Colors.blue),
                                SizedBox(width: 5),
                                Text(
                                  '${value.getUserPost.data!.data.posts[0].likeCount} Likes',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Row(
                              children: [
                                Icon(Icons.chat_bubble, color: Colors.blue),
                                SizedBox(width: 5),
                                Text(
                                  '${value.getUserPost.data!.data.posts[0].commentCount} Comments',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Delete Post Button
                      SizedBox(
                        height: 20,
                      ),
                      CustomRoundButton(
                          title: "Delete Post",
                          onPress: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Delete post"),
                                  content:
                                      Text("Are you sure to delete this post"),
                                  actions: [
                                    TextButton(
                                      child: Text("Cancel"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text("Delete"),
                                      onPressed: () {
                                        Map data = {
                                          "postId": widget.postId.toString()
                                        };
                                        authViewModel.deletePost(data, context);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
