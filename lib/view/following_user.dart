// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/data/response/status.dart';
// import 'package:flutter_application_1/res/component/round_button.dart';
// import 'package:flutter_application_1/view/other_user_profile.dart';
// import 'package:flutter_application_1/view_model/viewmodel/following_user.dart';
// import 'package:provider/provider.dart';

// class Following extends StatefulWidget {
//   const Following({super.key});

//   @override
//   State<Following> createState() => _FollowingState();
// }

// class _FollowingState extends State<Following> {
//   UserFollowingViewModel followingViewModel = UserFollowingViewModel();

//   @override
//   void initState() {
//     super.initState();
//     print("in Following Page");
//     followingViewModel.fetchUserFollowing();
//     print("in Following 1");
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("following"),
//         ),
//         body: ChangeNotifierProvider<UserFollowingViewModel>(
//             create: (BuildContext context) => followingViewModel,
//             child:
//                 Consumer<UserFollowingViewModel>(builder: (context, value, _) {
//               switch (value.userFollowing.status) {
//                 case Status.Loading:
//                   return const Center(
//                       child: CircularProgressIndicator(
//                     color: Colors.blue,
//                   ));
//                 case Status.Error:
//                   return Text(value.userFollowing.message.toString());
//                 case Status.Success:
//                   final followers = value.userFollowing.data;
//                   return SizedBox(
//                     child: followers!.data.following.isEmpty
//                         ? const Center(
//                             child: Text("No Following"),
//                           )
//                         : ListView.builder(
//                             itemCount: followers.data.following.length,
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                   onTap: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 OtherUserProfile(
//                                                     userId: followers
//                                                         .data
//                                                         .following[index]
//                                                         .user
//                                                         .id
//                                                         .toString())));
//                                   },
//                                   leading: const CircleAvatar(
//                                     child: Icon(
//                                       Icons.person,
//                                       size: 30,
//                                     ),
//                                   ),
//                                   title: Text(followers.data.following[index]
//                                           .user.username ??
//                                       ""),
//                                   subtitle: Text(followers
//                                           .data.following[index].user.email ??
//                                       ""),
//                                   trailing: SizedBox(
//                                       height: 35,
//                                       width: 90,
//                                       child: CustomRoundButton(
//                                         // loading: unFollowUserViewModel.removeLoading,
//                                         //  btnCallBack: () {
//                                         //    unFollowUserViewModel.unFollowApi(followers.data[index].userId.toString(), context);
//                                         // },
//                                         title: 'Remove', onPress: () {},
//                                       )));
//                             }),
//                   );
//                 default:
//                   return Container();
//               }
//             })));
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/data/response/status.dart';
// import 'package:flutter_application_1/res/component/round_button.dart';
// import 'package:flutter_application_1/view/other_user_profile.dart';
// import 'package:flutter_application_1/view_model/viewmodel/following_user.dart';

// import 'package:provider/provider.dart';

// class Following extends StatefulWidget {
//   const Following({super.key});

//   @override
//   State<Following> createState() => _FollowingState();
// }

// class _FollowingState extends State<Following> {
//   UserFollowingViewModel followingViewModel = UserFollowingViewModel();

//   @override
//   void initState() {
//     super.initState();
//     print("in Following Page");
//     followingViewModel.fetchUserFollowing();
//     print("in Following 1");
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("following"),
//         ),
//         body: ChangeNotifierProvider<UserFollowingViewModel>(
//             create: (BuildContext context) => followingViewModel,
//             child:
//                 Consumer<UserFollowingViewModel>(builder: (context, value, _) {
//               switch (value.userFollowing.status) {
//                 case Status.Loading:
//                   return const Center(
//                       child: CircularProgressIndicator(
//                     color: Colors.blue,
//                   ));
//                 case Status.Error:
//                   return Text(value.userFollowing.message.toString());
//                 case Status.Success:
//                   final followers = value.userFollowing.data;
//                   return SizedBox(
//                     child: followers!.data.following.isEmpty
//                         ? const Center(
//                             child: Text("No Following"),
//                           )
//                         : ListView.builder(
//                             itemCount: followers.data.following.length,
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                   onTap: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 OtherUserProfile(
//                                                     userId: followers
//                                                         .data
//                                                         .following[index]
//                                                         .user
//                                                         .id
//                                                         .toString())));
//                                   },
//                                   leading: const CircleAvatar(
//                                     child: Icon(
//                                       Icons.person,
//                                       size: 30,
//                                     ),
//                                   ),
//                                   title: Text(followers.data.following[index]
//                                           .user.username ??
//                                       ""),
//                                   subtitle: Text(followers
//                                           .data.following[index].user.email ??
//                                       ""),
//                                   trailing: SizedBox(
//                                       height: 35,
//                                       width: 90,
//                                       child: CustomRoundButton(
//                                         // loading: unFollowUserViewModel.removeLoading,
//                                         //  btnCallBack: () {
//                                         //    unFollowUserViewModel.unFollowApi(followers.data[index].userId.toString(), context);
//                                         // },
//                                         title: 'Remove', onPress: () {},
//                                       )));
//                             }),
//                   );
//                 default:
//                   return Container();
//               }
//             })));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/view/other_user_profile.dart';
import 'package:flutter_application_1/view_model/unfollowviewmodel.dart';
import 'package:flutter_application_1/view_model/viewmodel/following_user.dart';
//import 'package:instragram_clone/data/response/status.dart';
//import 'package:instragram_clone/res/component/elevatedbutton.dart';
//import 'package:instragram_clone/view/other_user_profile_screen.dart';
//import 'package:instragram_clone/view_model/unfollow_view_model.dart';
//import 'package:instragram_clone/view_model/widget/following_view_model.dart';

import 'package:provider/provider.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  UserFollowingViewModel followingViewModel = UserFollowingViewModel();
  UnFollowViewModel unFollowViewModel = UnFollowViewModel();
  @override
  void initState() {
    super.initState();
    print("in Following Page");
    followingViewModel.fetchUserFollowing();
    print("in Following 1");
  }

  @override
  Widget build(BuildContext context) {
    // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("following"),
        ),
        body: ChangeNotifierProvider<UserFollowingViewModel>(
            create: (BuildContext context) => followingViewModel,
            child:
                Consumer<UserFollowingViewModel>(builder: (context, value, _) {
              switch (value.userFollowing.status) {
                case Status.Loading:
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                case Status.Error:
                  return Text(value.userFollowing.message.toString());
                case Status.Success:
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
                                  leading: const CircleAvatar(
                                    child: Icon(
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
                debugPrint(followingUser.toString());
                unFollowViewModel.unfollowuser(followingUser, context);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
