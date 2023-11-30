import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
//import 'package:flutter_application_1/respository/edit_comment_repository.dart';
//import 'package:flutter_application_1/view_model/viewmodel/Likelist_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/comment_list_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/delete_comment_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/edit_comment_view_modal.dart';

import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  final String postId;
  const CommentScreen({super.key, required this.postId});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  CommentlistViewModel commentlistViewModel = CommentlistViewModel();
  DeleteCommentViewModel deleteCommentViewModel = DeleteCommentViewModel();
  EditCommentViewModel editCommentViewModel = EditCommentViewModel();

  @override
  void initState() {
    super.initState();
    print("in commentList Page");
    commentlistViewModel.fetchCommentlist(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    
    // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            
            onTap: ()=>Navigator.pop(context,),
            child: const Icon(Icons.arrow_back)),
          title: const Text("Comments"),
        ),
        body: ChangeNotifierProvider<CommentlistViewModel>(
            create: (BuildContext context) => commentlistViewModel,
            child: 
            
            Consumer<CommentlistViewModel>(builder: (context, value, _) {
              switch (value.listList.status) {
                case Status.Loading:
                  debugPrint("hello");
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                case Status.Error:
                  return Text(value.listList.message.toString());
                case Status.Success:
                  debugPrint("Success");
                  final followers = value.listList.data;
                  return 
                  
                  
                  SizedBox(
                    child: followers!.data.comments.isEmpty
                        ? const Center(
                            child: Text("No Comment"),
                          )
                        : ListView.builder(
                            itemCount: followers.data.comments.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => UserProfileScreen(
                                  //             userId: followers.data[index].userId
                                  //                 .toString())));
                                },
                                // leading: CircleAvatar(
                                //   child: Image.network(followers
                                //       .data.comments[index].user.profilePicture
                                //       .toString()),
                                //   // backgroundImage:followers.data.comments[index].user.profilePicture.toString()
                                //   // child:NetworkImage()
                                //   // Icon(
                                //   //   Icons.person,
                                //   //   size: 30,
                                //   // ),
                                // ),
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      followers.data.comments[index].user
                                          .profilePicture
                                          .toString(),
                                      width:
                                          60, // Set the desired width to maintain circular shape
                                      height:
                                          60, // Set the desired height to maintain circular shape
                                      fit: BoxFit
                                          .cover, // Ensure the image covers the circular area
                                    ),
                                  ),
                                ),
                                title: Text(followers
                                        .data.comments[index].user.username ??
                                    ""),
                                subtitle: Text("comment :" +
                                        followers
                                            .data.comments[index].comment ??
                                    ""),
                                trailing: InkWell(
                                    onTap: () {
                                      _openOptionsDialog(
                                          context,
                                          followers
                                              .data.comments[index].CommentsId
                                              .toString());
                                    },
                                    child: Icon(Icons.more_vert)),
                                // SizedBox(
                                //     height: 35,
                                //     width: 90,
                                //     child: RoundedButton(
                                //       // loading: unFollowUserViewModel.removeLoading,
                                //         btnName: "Remove", btnCallBack: () {
                                //            unFollowUserViewModel.unFollowApi(followers.data[index].userId.toString(), context);
                                //         }
                                //         )
                                //         )
                              );
                            }),
                  );
                default:
                  return Container();
              }
            }
            )
            )
            );
  }

  Future<void> _openOptionsDialog(
      BuildContext context, String commentId) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Comment Options"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text("Edit Comment"),
                onTap: () {
                  Navigator.pop(context);
                  _openEditCommentDialog(context, commentId);
                  // Close the dialog
                  // Navigate to the edit comment screen or perform edit action here
                },
              ),
              ListTile(
                title: const Text("Delete Comment"),
                onTap: () {
                  deleteCommentViewModel.deleteCommentApi(
                      widget.postId, commentId, context);
                  commentlistViewModel.fetchCommentlist(widget.postId);
                  Navigator.pop(context); // Close the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openEditCommentDialog(
      BuildContext context, String commentId) async {
    final TextEditingController commentController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Edit Comment"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: commentController,
                    decoration: const InputDecoration(
                      hintText: "Edit your comment...",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Save the edited comment (editedComment) and perform the edit action
                          Map<String, dynamic> data = {
                            "comment": commentController.text.toString()
                          };

                          editCommentViewModel.editCommentApi(
                              widget.postId, commentId, data, context);

                          commentlistViewModel.fetchCommentlist(widget.postId);
                          Navigator.pop(context); // Close the dialog
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}




