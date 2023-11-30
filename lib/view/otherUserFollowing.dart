import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/res/colors.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/view/other_user_profile.dart';
import 'package:flutter_application_1/view_model/otherUserFollowing.dart';

import 'package:provider/provider.dart';

class OtherUserFollowing extends StatefulWidget {
  final String userId;

  const OtherUserFollowing({super.key, required this.userId});

  @override
  State<OtherUserFollowing> createState() => _OtherUserFollowingState();
}

class _OtherUserFollowingState extends State<OtherUserFollowing> {
  //UserFollowingViewModel followingViewModel = UserFollowingViewModel();
  //UnFollowUserViewModel unFollowUserViewModel = UnFollowUserViewModel();
  OtherUserFollowingViewModel otherUserFollowingViewModel =
      OtherUserFollowingViewModel();
  @override
  void initState() {
    super.initState();
    print("in Following Page");
    debugPrint(widget.userId.toString());
    otherUserFollowingViewModel.fetchOtherUserFollowing(widget.userId);
    print("in Following 1");
  }

  @override
  Widget build(BuildContext context) {
    // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.googlelogin,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: AppColors.applelogin),
          title: Text(
            " other following",
            style: TextStyle(color: AppColors.applelogin),
          ),
        ),
        body: ChangeNotifierProvider<OtherUserFollowingViewModel>(
            create: (BuildContext context) => otherUserFollowingViewModel,
            child: Consumer<OtherUserFollowingViewModel>(
                builder: (context, value, _) {
              switch (value.userFollowing.status) {
                case Status.Loading:
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                case Status.Error:
                  return Text(value.userFollowing.message.toString());
                case Status.Success:
                  debugPrint("----------------");
                  final followers = value.userFollowing.data;

                  return SizedBox(
                    child: followers!.data.following.isEmpty
                        ? const Center(
                            child: Text("No Following"),
                          )
                        : ListView.builder(
                            itemCount: followers.data.following.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OtherUserProfile(
                                                    userId: followers
                                                        .data
                                                        .following[index]
                                                        .user
                                                        .id
                                                        .toString())));
                                  },
                                  leading: CircleAvatar(
                                    child: followers.data.following[index].user
                                                .profilePic !=
                                            null
                                        ? ClipOval(
                                            child: Image.network(
                                              followers.data.following[index]
                                                  .user.profilePic,
                                              fit: BoxFit.cover,
                                              width: 60,
                                              height: 60,
                                            ),
                                          )
                                        : Icon(
                                            Icons.person,
                                            size: 30,
                                          ),
                                  ),
                                  title: Text(followers.data.following[index]
                                          .user.username ??
                                      ""),
                                  subtitle: Text(followers
                                          .data.following[index].user.email ??
                                      ""),
                                  trailing: SizedBox(
                                      height: 35,
                                      width: 90,
                                      child: CustomRoundButton(
                                        title: 'unfollow',
                                        onPress: () {
                                          _showUnfollowDialog(
                                            context,
                                            followers
                                                .data.following[index].user.id
                                                .toString(),
                                            followers.data.following[index].user
                                                .username
                                                .toString(),
                                          );
                                        },
                                      )));
                            }),
                  );
                default:
                  return Container();
              }
            })));
  }

  // Function to show the Unfollow confirmation dialog
  void _showUnfollowDialog(
      BuildContext context, String followingUser, String Username) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Unfollow Confirmation"),
          content: Text("Are you sure you want to unfollow ${Username} ?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text("Unfollow"),
              onPressed: () {
                // debugPrint(followingUser.toString());
                // unFollowUserViewModel.unfollowUserApi(
                //     followingUser.toString(), context);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
