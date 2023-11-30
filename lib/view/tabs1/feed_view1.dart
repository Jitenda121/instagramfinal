import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/view/image_view_screen.dart';
import 'package:flutter_application_1/view_model/other_user_followers_view_modal.dart';
import 'package:flutter_application_1/view_model/user_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/other_view_model.dart';
import 'package:provider/provider.dart';

class FeedView1 extends StatefulWidget {
  final String userId;
  const FeedView1({super.key, required this.userId});

  @override
  State<FeedView1> createState() => _FeedView1State();
}

class _FeedView1State extends State<FeedView1> {
  OtherUserProfileViewModel otherUserProfileViewModel =
      OtherUserProfileViewModel();

  @override
  void initState() {
    super.initState();
    otherUserProfileViewModel.fetchUserProfile(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OtherUserProfileViewModel>(
      create: (BuildContext context) => otherUserProfileViewModel,
      child: Consumer<OtherUserProfileViewModel>(
        builder: (context, value, _) {
          switch (value.userProfile.status) {
            case Status.Loading:
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            case Status.Error:
              return Text(value.userProfile.message.toString());
            case Status.Success:
              // List<String> postImages = value
              //     .userProfile.data!.data.userPofile[0].userPosts
              //     .map((post) => post.url)
              //     .toList();
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
                    dynamic postId = value.userProfile.data!.data.userPofile[0]
                        .userPosts[index].id;
                    final imageUrl = postImages[index];
                    debugPrint(postId);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImageViewScreen(
                          imageUrl: imageUrl,
                          postId: postId,
                        ),
                      ),
                    );
                    // String postId = value.userProfile.data!.data.userPofile[0]
                    //     .userPosts[index].id;
                    // _showImageDialog(context, postImages[index], postId);
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
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.blue),
                              ),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          // Handle errors here
                          return const Center(
                            child: Text('Error loading image'),
                          );
                        },
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
}
