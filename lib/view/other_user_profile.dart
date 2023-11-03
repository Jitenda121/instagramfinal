import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/view/edit_profile.dart';
import 'package:flutter_application_1/view/follower_user.dart';
import 'package:flutter_application_1/view/following_user.dart';
import 'package:flutter_application_1/view/tabs/feed_view.dart';
import 'package:flutter_application_1/view/tabs/reels_view.dart';
import 'package:flutter_application_1/view/tabs/tagged_view.dart';
import 'package:flutter_application_1/view_model/viewmodel/customDrawer.dart';
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
              backgroundColor: const Color.fromARGB(255, 112, 180, 235),
            ),
            endDrawer:  CustomDrawer(),
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
                                              const Following()),
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Text(value.userProfile.data!.data
                                          .userPofile[0].followingCount
                                          .toString()),
                                      // Text(
                                      //   userProfile?.userPofile[0].followingCount
                                      //           .toString() ??
                                      //       '0',
                                      //   style: const TextStyle(
                                      //     fontWeight: FontWeight.bold,
                                      //     fontSize: 20,
                                      //   ),
                                      // ),
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
                                              const FollowersScreen()),
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Text(value.userProfile.data!.data
                                          .userPofile[0].followerCount
                                          .toString()),
                                      // Text(
                                      //   userProfile?.userPofile[0].followerCount.toString() ??
                                      //       '0',
                                      //   style: const TextStyle(
                                      //     fontWeight: FontWeight.bold,
                                      //     fontSize: 20,
                                      //   ),
                                      // ),
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
                                      text: "\nFlutter Developer",
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
                              TextButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //            EditProfile()),
                                  // );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 172, 167, 167),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TabBar(tabs: tabs),
                          SizedBox(
                            height: 1000,
                            child: TabBarView(children: tabBarViews),
                          ),
                        ],
                      );

                    default:
                      return Container();
                  }
                }))));
  }
}
