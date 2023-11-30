// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/model/User_feeds.dart';
import 'package:flutter_application_1/res/colors.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';
import 'package:flutter_application_1/view/Likelist_Screen.dart';
import 'package:flutter_application_1/view/bottommodalsheet/bottommodalsheet.dart';
import 'package:flutter_application_1/view/commentScreen.dart';
import 'package:flutter_application_1/view/notificationScreen.dart';
import 'package:flutter_application_1/view_model/dislike_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/User_feeds_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/like_notification_view_modal.dart';
import 'package:flutter_application_1/view_model/viewmodel/like_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/report_post_viewModel.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  UserFeedsViewModel userFeedsViewModel = UserFeedsViewModel();
  LikePostViewModel likePostViewModel = LikePostViewModel();
  ReportPostViewModel reportPostViewModel = ReportPostViewModel();
  DisLikePostViewModel disLikePostViewModel = DisLikePostViewModel();
  PostNotificationViewModel postNotificationViewModel =
      PostNotificationViewModel();

  bool isFavorite = false;

  Future<void> onRefresh() async {
    try {
      // Fetch new data or perform necessary operations here
      await userFeedsViewModel.fetchUserfeeds();
    } finally {
      // Complete the refresh indicator animation even if there was an error
      // This ensures that the indicator disappears after the refresh is complete
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }

  List<ValueNotifier<bool>> isFavoriteList = [];

  @override
  void initState() {
    debugPrint("in homepage");
    userFeedsViewModel.fetchUserfeeds();
    getUserIdFromSharedPreferences();
    super.initState();
  }

  String? userId;
  void getUserIdFromSharedPreferences() async {
    userId = await SharedPreferencesManager.getUSerId();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return ChangeNotifierProvider<UserFeedsViewModel>(
        create: (BuildContext context) => userFeedsViewModel,
        child: Consumer<UserFeedsViewModel>(builder: (context, value, _) {
          switch (value.userFeeds.status) {
            case Status.Loading:
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            case Status.Error:
              return Text(value.userFeeds.message.toString());
            case Status.Success:
              isFavoriteList = List.generate(
                  value.userFeeds.data!.userFeed.length,
                  (index) => ValueNotifier<bool>(false));
              // List<bool> isFavoriteList = List.generate(
              //     value.userFeeds.data!.data.length, (index) => false);
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  elevation: 3,
                  centerTitle: true,
                  title: Text(
                    "Instagram",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: AppColors.applelogin),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationScreen()));
                      },
                      icon: const Icon(Icons.notifications_active_outlined,
                          size: 30, color: Colors.black),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      RefreshIndicator(
                        onRefresh: onRefresh,
                        child: SizedBox(
                          // height: 200,
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                            itemCount: value.userFeeds.data!.userFeed.length,
                            //itemCount: 9,
                            itemBuilder: (context, index) {
                              UserFeed userFeedData =
                                  value.userFeeds.data!.userFeed[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.blue,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              const CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.blue),
                                              ),
                                              ClipOval(
                                                child: Image.network(
                                                  userFeedData
                                                      .userData.profilePic
                                                      .toString(),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    } else {
                                                      return Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                              ? loadingProgress
                                                                      .cumulativeBytesLoaded /
                                                                  (loadingProgress
                                                                          .expectedTotalBytes ??
                                                                      1)
                                                              : null,
                                                          valueColor:
                                                              const AlwaysStoppedAnimation<
                                                                      Color>(
                                                                  Colors.blue),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        value.userFeeds.data!.userFeed[index]
                                            .userData.username
                                            .toString(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: InkWell(
                                                    onTap: () {},
                                                    child:
                                                        const Text("Report")),
                                                content: const Text(
                                                    "Do you want to report this Post?"),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text("Report"),
                                                    onPressed: () {
                                                      // Perform additional actions when the user reports the content
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                "Report Confirmation"),
                                                            content: const Text(
                                                                "Are you sure to report this post"),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child:
                                                                    const Text(
                                                                        "OK"),
                                                                onPressed: () {
                                                                  debugPrint(value
                                                                      .userFeeds
                                                                      .data!
                                                                      .userFeed[
                                                                          index]
                                                                      .userPosts
                                                                      .id
                                                                      .toString());

                                                                  reportPostViewModel.reportPostApi(
                                                                      value
                                                                          .userFeeds
                                                                          .data!
                                                                          .userFeed[
                                                                              index]
                                                                          .userPosts
                                                                          .id
                                                                          .toString(),
                                                                      context);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the confirmation dialog
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the original report dialog
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.more_vert),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    width: MediaQuery.of(context).size.width,
                                    child: Image.network(
                                      value.userFeeds.data!.userFeed[index]
                                          .userPosts.url
                                          .toString(),
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          // If no progress is available, display the child (the image)
                                          return child;
                                        } else {
                                          // If there's progress, display a loading indicator
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      (loadingProgress
                                                              .expectedTotalBytes ??
                                                          1)
                                                  : null,
                                            ),
                                          );
                                        }
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        // Handle errors here
                                        return const Center(
                                            child: Text('Error loading image'));
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        8.0), // Add some padding for the caption
                                    child: Text(
                                      'Caption  :${value.userFeeds.data!.userFeed[index].userPosts.caption}', // Replace with your actual caption
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          value.userFeeds.data!.userFeed[index]
                                                  .userPosts.isLiked =
                                              !(value
                                                  .userFeeds
                                                  .data!
                                                  .userFeed[index]
                                                  .userPosts
                                                  .isLiked);
                                          setState(() {});
                                          if (!(value
                                              .userFeeds
                                              .data!
                                              .userFeed[index]
                                              .userPosts
                                              .isLiked)) {
                                            value
                                                .userFeeds
                                                .data!
                                                .userFeed[index]
                                                .userPosts
                                                .likeCount = value
                                                    .userFeeds
                                                    .data!
                                                    .userFeed[index]
                                                    .userPosts
                                                    .likeCount -
                                                1;
                                            setState(() {});
                                            // Call the DisLikePostApi when the user has already liked the post

                                            await disLikePostViewModel
                                                .DisLikePostApi(
                                              value.userFeeds.data!
                                                  .userFeed[index].userPosts.id
                                                  .toString(),
                                              context,
                                            );
                                          } else {
                                            value
                                                .userFeeds
                                                .data!
                                                .userFeed[index]
                                                .userPosts
                                                .likeCount = value
                                                    .userFeeds
                                                    .data!
                                                    .userFeed[index]
                                                    .userPosts
                                                    .likeCount +
                                                1;
                                            setState(() {});
                                            // Call the LikePostApi when the user hasn't liked the post
                                            // final result =
                                            await likePostViewModel.LikePostApi(
                                              value.userFeeds.data!
                                                  .userFeed[index].userPosts.id
                                                  .toString(),
                                              context,
                                            );

                                            if (userId !=
                                                value
                                                    .userFeeds
                                                    .data!
                                                    .userFeed[index]
                                                    .userPosts
                                                    .userId) {
                                              Map data = {
                                                "receiverId": value
                                                    .userFeeds
                                                    .data!
                                                    .userFeed[index]
                                                    .userData
                                                    .id,
                                                "activityId": value
                                                    .userFeeds
                                                    .data!
                                                    .userFeed[index]
                                                    .userPosts
                                                    .id
                                                    .toString(),
                                                "type": "LIKE",
                                              };
                                              postNotificationViewModel
                                                  .deleteCommentApi(
                                                      data, context);
                                            }
                                            // if (result) {
                                            //   // Fetch user feeds only if the LikePostApi was successful
                                            //   await userFeedsViewModel
                                            //       .fetchUserfeeds();
                                            // }
                                          }
                                          userFeedsViewModel.fetchedFetch();
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: value
                                                  .userFeeds
                                                  .data!
                                                  .userFeed[index]
                                                  .userPosts
                                                  .isLiked
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          String postId = value.userFeeds.data!
                                              .userFeed[index].userPosts.id
                                              .toString();
                                          String targetUser = value.userFeeds
                                              .data!.userFeed[index].userData.id
                                              .toString();
                                          _showBottomSheet(
                                              context, postId, targetUser);
                                        },
                                        icon: const Icon(
                                            Icons.chat_bubble_outline),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LikelistScreen(
                                                          postId: value
                                                              .userFeeds
                                                              .data!
                                                              .userFeed[index]
                                                              .userPosts
                                                              .id
                                                              .toString(),
                                                        )));
                                          },
                                          child: Text(
                                              '${value.userFeeds.data!.userFeed[index].userPosts.likeCount.toString()} Likes')),
                                      TextButton(
                                        onPressed: () async {
                                          var v = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommentScreen(
                                                        postId: value
                                                            .userFeeds
                                                            .data!
                                                            .userFeed[index]
                                                            .userPosts
                                                            .id
                                                            .toString(),
                                                      )));
                                          if (v != null) {
                                            value
                                                .userFeeds
                                                .data!
                                                .userFeed[index]
                                                .userPosts
                                                .commentCount = v;
                                          }
                                        },
                                        child: Text(
                                            '${value.userFeeds.data!.userFeed[index].userPosts.commentCount.toString()} comments'),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            default:
              return Container();
          }
        }));
  }

  void _showBottomSheet(
      BuildContext context, String postId, String targetUser) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return YourBottomSheetWidget(
          postId: postId,
          targetUser: targetUser,
          onCommentPosted: (commentPostedSuccessfully) {
            if (commentPostedSuccessfully) {
              // Fetch the user feed when the comment is successful
              userFeedsViewModel.fetchedFetch();
            }
          },
        ); // Replace YourBottomSheetWidget() with your actual bottom sheet widget.
      },
    );
  }
}
