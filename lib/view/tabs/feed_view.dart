import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/view_model/user_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  UserProfileViewModel userProfileViewModel = UserProfileViewModel();

  @override
  void initState() {
    super.initState();
    userProfileViewModel.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProfileViewModel>(
      create: (BuildContext context) => userProfileViewModel,
      child: Consumer<UserProfileViewModel>(
        builder: (context, value, _) {
          switch (value.userProfile.status) {
            case Status.Loading:
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            case Status.Error:
              return Text(value.userProfile.message.toString());
            case Status.Success:
              List<String> postImages = value
                  .userProfile.data!.data.userPofile[0].userPosts
                  .map((post) => post.url)
                  .toList();
              return GridView.builder(
                itemCount: value.userProfile.data!.data.userPofile[0].postCount,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    String postId = value.userProfile.data!.data.userPofile[0]
                        .userPosts[index].id;
                    _showImageDialog(context, postImages[index], postId);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      height: 150,
                      child: Image.network(
                        postImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }

  void confirmDeleteImageDialogBox(
      BuildContext context, String imageId, AuthViewModel authViewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Image'),
          content: Text('Are you sure you want to delete this image?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Access authViewModel here and perform necessary actions
                // Replace doSomething() with the actual function you want to call
                Map data = {
                  // String postId = imageId.toString();

                  "postId": imageId
                };
                // String postId = imageId;
                //String postId = imageId;
                authViewModel.deletePost(data, context);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl, String postId) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl, fit: BoxFit.cover),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      debugPrint(postId);
                      confirmDeleteImageDialogBox(
                          context, postId, authViewModel);
                    },
                    child: const Text(
                      "Delete Post",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
