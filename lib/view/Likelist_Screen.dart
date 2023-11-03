import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/view_model/viewmodel/Likelist_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/followers_view.dart';

import 'package:provider/provider.dart';

class LikelistScreen extends StatefulWidget {
  final String postId;
  const LikelistScreen({super.key, required this.postId});

  @override
  State<LikelistScreen> createState() => _LikelistScreenState();
}

class _LikelistScreenState extends State<LikelistScreen> {
  LikelistViewModel likelistViewModel = LikelistViewModel();

  @override
  void initState() {
    super.initState();
    print("in Followers Page");
    likelistViewModel.fetchLikelist(widget.postId);
    print("in Followers 1");
  }

  @override
  Widget build(BuildContext context) {
    // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Likes"),
        ),
        body: ChangeNotifierProvider<LikelistViewModel>(
            create: (BuildContext context) => likelistViewModel,
            child: Consumer<LikelistViewModel>(builder: (context, value, _) {
              switch (value.listList.status) {
                case Status.Loading:
                  debugPrint("hello");
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                case Status.Error:
                  return Text(value.listList.message.toString());
                case Status.Success:
                  debugPrint("Success");
                  final followers = value.listList.data;
                  return SizedBox(
                    child: followers!.data.likes.isEmpty
                        ? const Center(
                            child: Text("No Following"),
                          )
                        : ListView.builder(
                            itemCount: followers.data.likes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => UserProfileScreen(
                                  //             userId: followers.data[index].userId
                                  //                 .toString())));
                                },
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      followers.data.likes[0].user.profilePic,
                                      width:
                                          60, // Set the desired width to maintain circular shape
                                      height:
                                          60, // Set the desired height to maintain circular shape
                                      fit: BoxFit
                                          .cover, // Ensure the image covers the circular area
                                    ),
                                  ),
                                  // Icon(
                                  //   Icons.person,
                                  //   size: 30,
                                  // ),
                                ),
                                title: Text(
                                    followers.data.likes[index].user.username ??
                                        ""),
                                subtitle: Text(
                                    followers.data.likes[index].user.email ??
                                        ""),
                                // trailing: SizedBox(
                                //     height: 35,
                                //     width: 90,
                                //     child: RoundedButton(
                                //       // loading: unFollowUserViewModel.removeLoading,
                                //         btnName: "Remove", btnCallBack: () {
                                //            unFollowUserViewModel.unFollowApi(followers.data[index].userId.toString(), context);
                                //         }
                                //         )
                                //         )
                              );
                            }),
                  );
                default:
                  return Container();
              }
            })));
  }
}
