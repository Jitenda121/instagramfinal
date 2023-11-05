import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/view/other_user_profile.dart';
import 'package:flutter_application_1/view_model/viewmodel/followers_view.dart';

import 'package:provider/provider.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  UserFollowersViewModel followersViewModel = UserFollowersViewModel();

  @override
  void initState() {
    super.initState();
    print("in Followers Page");
    followersViewModel.fetchUserFollowers();
    print("in Followers 1");
  }

  @override
  Widget build(BuildContext context) {
    // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Followers"),
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back_ios), // Use the appropriate icon for iOS
            onPressed: () {
              Navigator.of(context)
                  .pop(); // This will navigate back when the button is pressed
            },
          ),
        ),
        body: ChangeNotifierProvider<UserFollowersViewModel>(
            create: (BuildContext context) => followersViewModel,
            child:
                Consumer<UserFollowersViewModel>(builder: (context, value, _) {
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
                            child: Text("No Following"),
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
                                                    userId: followers
                                                        .data
                                                        .followers[index]
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
                                  title: Text(followers.data.followers[index]
                                          .user.username ??
                                      ""),
                                  subtitle: Text(followers
                                          .data.followers[index].user.email ??
                                      ""),
                                  trailing: SizedBox(
                                      height: 35,
                                      width: 90,
                                      child: CustomRoundButton(
                                        // loading: unFollowUserViewModel.removeLoading,
                                        title: "Remove",
                                        onPress: () {
                                          // unFollowUserViewModel.unFollowApi(
                                          //     followers.data[index].userId
                                          //         .toString(),
                                          //     context);
                                        },

                                        // unFollowUserViewModel.unFollowApi(followers.data[index].userId.toString(), context);
                                      )));
                            }),
                  );
                default:
                  return Container();
              }
            })));
  }
}
