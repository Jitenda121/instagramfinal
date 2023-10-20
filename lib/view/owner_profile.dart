import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
//import 'package:flutter_application_1/view/edit_profile.dart';
//import 'package:flutter_application_1/view/user_followers.dart';
import 'package:flutter_application_1/view/tabs/feed_view.dart';
import 'package:flutter_application_1/view/tabs/reels_view.dart';
import 'package:flutter_application_1/view/tabs/tagged_view.dart';
//import 'package:flutter_application_1/view/user_following.dart';
import 'package:flutter_application_1/view_model/viewmodel/customDrawer.dart';

class OwnerProfile extends StatefulWidget {
  const OwnerProfile({super.key});

  @override
  State<OwnerProfile> createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  // Create a ScrollController
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
  final List<Widget> tabBarViews = [const FeedView(), const ReelsView(), const TaggedView()];

  @override
  Widget build(BuildContext context) {
    //final userPreference = Provider.of<UserViewModel>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        endDrawer: const CustomDrawer(),
        body: ListView(
          controller: _scrollController, // Assign the ScrollController here
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[400],
                        image: const DecorationImage(
                            image: AssetImage("images/images (1).jpeg"))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Calculate the position you want to scroll to (adjust the offset as needed)
                    double offset =
                        300.0; // Example offset, adjust based on your layout

                    
                    _scrollController.animateTo(
                      offset,
                      duration: const Duration(
                          milliseconds: 500), // Adjust the duration as needed
                      curve:
                          Curves.easeInOut, // Use your desired animation curve
                    );
                  },
                  child: const Column(
                    children: [
                      Text(
                        "20",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Post")
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.following);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Following()));
                  },
                  child: const Column(
                    children: [
                      Text(
                        "362",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Following")
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.followers);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Followers()));
                  },
                  child: const Column(
                    children: [
                      Text(
                        "21.1k",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Followers")
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Jitendra\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "Add Description",
                        style: TextStyle(
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.editprofile);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text("Edit Profile"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Contact",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(tabs: tabs),
            SizedBox(height: 1000, child: TabBarView(children: tabBarViews)),
          ],
        ),
      ),
    );
  }
}
