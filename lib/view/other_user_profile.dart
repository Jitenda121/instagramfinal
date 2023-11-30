import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/res/colors.dart';
import 'package:flutter_application_1/respository/shared_preference.dart';
import 'package:flutter_application_1/view/bottommodalsheet/bottommodalsheet.dart';
import 'package:flutter_application_1/view/otherUserFollowers.dart';
import 'package:flutter_application_1/view/otherUserFollowing.dart';
import 'package:flutter_application_1/view/tabs/feed_view.dart';
import 'package:flutter_application_1/view/tabs/reels_view.dart';
import 'package:flutter_application_1/view/tabs/tagged_view.dart';
import 'package:flutter_application_1/view/tabs1/feed_view1.dart';
import 'package:flutter_application_1/view/tabs1/reel_view1.dart';
import 'package:flutter_application_1/view/tabs1/tagges_view1.dart';
import 'package:flutter_application_1/view_model/followviewmodel.dart';
import 'package:flutter_application_1/view_model/unfollowviewmodel.dart';
import 'package:flutter_application_1/view_model/viewmodel/like_notification_view_modal.dart';
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
  PostNotificationViewModel postNotificationViewModel =
      PostNotificationViewModel();
  late List<Widget> tabBarViews;
  // @override
  // void initState() {
  //   super.initState();
  //   otheruserProfileViewModel.fetchUserProfile(widget.userId);
  // }

  @override
  void initState() {
    super.initState();
    tabBarViews = [
      FeedView1(userId: widget.userId),
      const ReelsView1(),
      const TaggedView1(),
    ];
    otheruserProfileViewModel.fetchUserProfile(widget.userId);
    getUserIdFromSharedPreferences();
  }

  String? UserId;
  void getUserIdFromSharedPreferences() async {
    UserId = await SharedPreferencesManager.getUSerId();

    debugPrint("--------------userId------------");
    debugPrint(userId ?? "User ID is null");
    debugPrint("--------------userId------------");
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              centerTitle: true,
              title: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(color: AppColors.applelogin),
              backgroundColor: AppColors.googlelogin,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: value.userProfile.data!.data
                                          .userPofile[0].profilePic,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.blue),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.person,
                                        color: AppColors.applelogin,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(value.userProfile.data!.data
                                      .userPofile[0].postCount
                                      .toString()),
                                  const SizedBox(height: 5),
                                  const Text("Post"),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtherUserFollowing(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 20),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                                      // Name (bold and larger font size)
                                      TextSpan(
                                        text: value.userProfile.data!.data
                                            .userPofile[0].username,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '\nFullName: ${value.userProfile.data!.data.userPofile[0].fullName}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      // Username (bold but smaller font size)
                                      TextSpan(
                                        text:
                                            '\n${value.userProfile.data!.data.userPofile[0].email}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),

                                      TextSpan(
                                        text:
                                            '\nBio: ${value.userProfile.data!.data.userPofile[0].profileBio}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * .5,
                                height:
                                    MediaQuery.of(context).size.height * .05,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.buttoncolor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: value.userProfile.data!.data
                                              .userPofile[0].isFollowing ==
                                          true
                                      ? InkWell(
                                          onTap: () async {
                                            bool sucess =
                                                await unFollowViewModel
                                                    .unfollowuser(
                                              widget.userId.toString(),
                                              context,
                                            );
                                            if (sucess) {
                                              otheruserProfileViewModel
                                                  .fetchUserProfile(
                                                      widget.userId);
                                            }
                                          },
                                          child: Text(
                                            "unfollow",
                                            style: TextStyle(
                                              color: AppColors.googlelogin,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () async {
                                            Map data1 = {
                                              "followingId":
                                                  widget.userId.toString(),
                                            };
                                            bool success2 =
                                                await followUserViewModel
                                                    .followUserApi(
                                              data1,
                                              context,
                                            );
                                            Map data = {
                                              "receiverId":
                                                  widget.userId.toString(),
                                              "activityId": UserId.toString(),
                                              "type": "FOLLOW_USER",
                                            };
                                            debugPrint("######");
                                            debugPrint(
                                                widget.userId.toString());
                                            debugPrint(UserId.toString());
                                            postNotificationViewModel
                                                .deleteCommentApi(
                                                    data, context);
                                            if (success2) {
                                              otheruserProfileViewModel
                                                  .fetchUserProfile(
                                                      widget.userId);
                                            }
                                          },
                                          child: Text(
                                            "follow",
                                            style: TextStyle(
                                              color: AppColors.googlelogin,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
