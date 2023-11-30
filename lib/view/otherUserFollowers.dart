import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/res/colors.dart';
import 'package:flutter_application_1/view/other_user_profile.dart';
import 'package:flutter_application_1/view_model/other_user_followers_view_modal.dart';

import 'package:provider/provider.dart';

class OtherUserFollowers extends StatefulWidget {
  final String userId;

  const OtherUserFollowers({super.key, required this.userId});

  @override
  State<OtherUserFollowers> createState() => _OtherUserFollowersState();
}

class _OtherUserFollowersState extends State<OtherUserFollowers> {
  //UserFollowingViewModel followingViewModel = UserFollowingViewModel();
  //UnFollowUserViewModel unFollowUserViewModel = UnFollowUserViewModel();
  OtherUserFollowerViewModel otherUserFollowerViewModel =
      OtherUserFollowerViewModel();
  @override
  @override
  void initState() {
    super.initState();
    print("in Followers Page");
    otherUserFollowerViewModel.fetchOtherUserFollowers(widget.userId);
    print("in Followers 1");
  }

  @override
  Widget build(BuildContext context) {
    // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: AppColors.applelogin),
          backgroundColor: AppColors.googlelogin,
          title: Text(
            "followers",
            style: TextStyle(color: AppColors.applelogin),
          ),
        ),
        body: ChangeNotifierProvider<OtherUserFollowerViewModel>(
            create: (BuildContext context) => otherUserFollowerViewModel,
            child: Consumer<OtherUserFollowerViewModel>(
                builder: (context, value, _) {
              switch (value.userFollowers.status) {
                case Status.Loading:
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                case Status.Error:
                  return Text(value.userFollowers.message.toString());
                case Status.Success:
                  final followers = value.userFollowers.data;
                  return SizedBox(
                    child: followers!.data.followers.isEmpty
                        ? const Center(
                            child: Text("No Followers"),
                          )
                        : ListView.builder(
                            itemCount: followers.data.followers.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OtherUserProfile(
                                                  userId: followers.data
                                                      .followers[index].user.id
                                                      .toString())));
                                },
                                leading: CircleAvatar(
                                  child: followers.data.followers[index].user
                                              .profilePic !=
                                          null
                                      ? ClipOval(
                                          child: Image.network(
                                            followers.data.followers[index].user
                                                .profilePic,
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

                                title: Text(followers
                                        .data.followers[index].user.username ??
                                    ""),
                                subtitle: Text(followers
                                        .data.followers[index].user.email ??
                                    ""),
// trailing: SizedBox(
                                //     height: 35,
                                //     width: 90,
                                //     child: CustomRoundButton(
                                //       title: 'unfollow',
                                //       onPress: () {
                                //         _showUnfollowDialog(
                                //           context,
                                //           followers
                                //               .data.followers[index].user.id
                                //               .toString(),
                                //           followers.data.followers[index].user
                                //               .username
                                //               .toString(),
                                //         );
                                //       },
                                //     )
                                //     )
                              );
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
