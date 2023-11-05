import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/view/otherUserFollowers.dart';
import 'package:flutter_application_1/view/otherUserFollowing.dart';
import 'package:flutter_application_1/view/tabs/feed_view.dart';
import 'package:flutter_application_1/view/tabs/reels_view.dart';
import 'package:flutter_application_1/view/tabs/tagged_view.dart';
import 'package:flutter_application_1/view_model/followviewmodel.dart';
import 'package:flutter_application_1/view_model/unfollowviewmodel.dart';
import 'package:flutter_application_1/view_model/viewmodel/other_view_model.dart';

import 'package:provider/provider.dart';

class OtherUserProfile extends StatefulWidget {
  final String userId;

  const OtherUserProfile({Key? key, required this.userId}) : super(key: key);

  @override
  State<OtherUserProfile> createState() => _OtherUserProfileState();
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  OtherUserProfileViewModel otheruserProfileViewModel =
      OtherUserProfileViewModel();
  FollowUserViewModel followUserViewModel = FollowUserViewModel();
  UnFollowViewModel unFollowViewModel = UnFollowViewModel();

  @override
  void initState() {
    super.initState();
    otheruserProfileViewModel.fetchUserProfile(widget.userId);
  }

  final List<Widget> tabs = [
    const Tab(
      icon: Icon(
        Icons.image,
        color: Colors.black,
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.video_collection,
        color: Colors.grey,
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.bookmark,
        color: Colors.grey,
      ),
    ),
  ];

  final List<Widget> tabBarViews = [
    const FeedView(),
    const ReelsView(),
    const TaggedView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              centerTitle: false,
              title: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            //  endDrawer: CustomDrawer(),
            body: ChangeNotifierProvider<OtherUserProfileViewModel>(
                create: (BuildContext context) => otheruserProfileViewModel,
                child: Consumer<OtherUserProfileViewModel>(
                    builder: (context, value, _) {
                  switch (value.userProfile.status) {
                    case Status.Loading:
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      ));
                    case Status.Error:
                      return Text(value.userProfile.message.toString());
                    case Status.Success:
                      // dynamic user = value.userProfile.data!.data.userPofile[0].;
                      return ListView(
                        children: <Widget>[
                          const SizedBox(height: 10),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(value.userProfile.data!.data
                                        .userPofile[0].postCount
                                        .toString()),
                                    // Text(
                                    //   userProfile?.userPofile[0].postCount.toString() ?? '0',
                                    //   style: const TextStyle(
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 20,
                                    //   ),
                                    // ),
                                    const SizedBox(height: 5),
                                    const Text("Post"),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OtherUserFollowing(
                                                userId: widget.userId),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Text(value.userProfile.data!.data
                                          .userPofile[0].followingCount
                                          .toString()),
                                      const SizedBox(height: 5),
                                      const Text("Following"),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OtherUserFollowers(
                                                userId: widget.userId,
                                              )),
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Text(value.userProfile.data!.data
                                          .userPofile[0].followerCount
                                          .toString()),
                                      const SizedBox(height: 5),
                                      const Text("Followers"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 20),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: value.userProfile.data!.data
                                          .userPofile[0].username,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const TextSpan(
                                      //text: "\nFlutter Developer",
                                      //    text: userProfile?.userPofile[0].email ?? 'Your Email',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: value.userProfile.data!.data
                                              .userPofile[0].isFollowing ==
                                          true
                                      ? InkWell(
                                          onTap: () {
                                            unFollowViewModel.unfollowuser(
                                              widget.userId.toString(),
                                              context,
                                            );
                                            otheruserProfileViewModel
                                                .fetchUserProfile(
                                                    widget.userId);
                                            otheruserProfileViewModel
                                                .fetchUserProfile(
                                                    widget.userId);
                                          },
                                          child: Text(
                                            "unfollow",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            followUserViewModel.followUserApi(
                                              widget.userId,
                                              context,
                                            );
                                            otheruserProfileViewModel
                                                .fetchUserProfile(
                                                    widget.userId);
                                            otheruserProfileViewModel
                                                .fetchUserProfile(
                                                    widget.userId);
                                          },
                                          child: Text(
                                            "follow",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              // TextButton(
                              //   onPressed: () {
                              //     // Navigator.push(
                              //     //   context,
                              //     //   MaterialPageRoute(
                              //     //       builder: (context) =>
                              //     //            EditProfile()),
                              //     // );
                              //   },
                              //   style: TextButton.styleFrom(
                              //     backgroundColor:
                              //         const Color.fromARGB(255, 172, 167, 167),
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20),
                              //     ),
                              //   ),
                              //   child: const Text(
                              //     "Edit Profile",
                              //     style: TextStyle(
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      );

                    default:
                      return Container();
                  }
                }))));
  }
}
