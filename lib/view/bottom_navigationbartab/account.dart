import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/res/colors.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view/following_user.dart';
import 'package:flutter_application_1/view/otherUserFollowers.dart';
import 'package:flutter_application_1/view/tabs/feed_view.dart';
import 'package:flutter_application_1/view/tabs/reels_view.dart';
import 'package:flutter_application_1/view/tabs/tagged_view.dart';
import 'package:flutter_application_1/view_model/user_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class OwnerProfile extends StatefulWidget {
  const OwnerProfile({super.key});

  @override
  State<OwnerProfile> createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  UserProfileViewModel userProfileViewModel = UserProfileViewModel();

  final ScrollController _scrollController = ScrollController();

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
    )
  ];
  final List<Widget> tabBarViews = [
    const FeedView(),
    const ReelsView(),
    const TaggedView()
  ];
  @override
  void initState() {
    super.initState();
    userProfileViewModel.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    // final userPorile = Provider.of<UserViewModel>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm Logout"),
                      content: const Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            authViewModel.logout(context);
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await userProfileViewModel.fetchUserProfile();
          },
          child: ChangeNotifierProvider<UserProfileViewModel>(
              create: (BuildContext context) => userProfileViewModel,
              child:
                  Consumer<UserProfileViewModel>(builder: (context, value, _) {
                switch (value.userProfile.status) {
                  case Status.Loading:
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                    ));
                  case Status.Error:
                    return Text(value.userProfile.message.toString());
                  case Status.Success:
                    Map userData = {
                      "pic": value
                          .userProfile.data!.data.userPofile[0].profilePic
                          .toString(),
                      "bio": value
                          .userProfile.data!.data.userPofile[0].profileBio
                          .toString(),
                      "name": value
                          .userProfile.data!.data.userPofile[0].username
                          .toString()
                    };
                    // dynamic user = value.userProfile.data!.data.userPofile[0].;
                    return ListView(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: value.userProfile.data!.data
                                      .userPofile[0].profilePic
                                      .toString(),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.blue),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.person,
                                    color: AppColors.applelogin,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                double targetY = 290.0;
                                _scrollController.animateTo(
                                  targetY, // Scroll to the top of the ListView
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(value.userProfile.data!.data
                                      .userPofile[0].postCount
                                      .toString()),
                                  const SizedBox(height: 5),
                                  const Text("Post"),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Following()),
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
                                Navigator.pushNamed(
                                    context, RoutesName.followers);
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
                        const SizedBox(height: 25),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
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
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomRoundButton(
                              title: "EditProfile",
                              onPress: () {
                                Navigator.pushNamed(
                                    context, RoutesName.editprofile,
                                    arguments: userData);
                              }),
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
              })),
        ),
      ),
    );
  }
}
