import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/view/other_user_profile.dart';
import 'package:flutter_application_1/view_model/followviewmodel.dart';
import 'package:flutter_application_1/view_model/search_view_modal.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';

import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchUserViewModel searchUserViewModel;
  final TextEditingController searchController = TextEditingController();
  FollowUserViewModel followUserViewModel = FollowUserViewModel();

  @override
  void initState() {
    super.initState();
    searchUserViewModel = SearchUserViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomTextField(
                controller: searchController,
                hintText: "Search",
                prefixIcon: Icons.search,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomRoundButton(
            title: "Search",
            onPress: () {
              searchUserViewModel.SeachUserProfile(
                searchController.text,
              );
            },
          ),
          Expanded(
            child: ChangeNotifierProvider<SearchUserViewModel>.value(
              value: searchUserViewModel,
              child:
                  Consumer<SearchUserViewModel>(builder: (context, value, _) {
                switch (value.searchUser.status) {
                  case Status.Loading:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  case Status.Error:
                    return Center(child: Text("No Matching Result Found"));
                  case Status.Success:
                    final Search = value.searchUser.data;
                    return SizedBox(
                      child: Search!.data.isEmpty
                          ? const Center(
                              child: Text("No User Found"),
                            )
                          : ListView.builder(
                              itemCount: Search.data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OtherUserProfile(
                                          userId: Search.data[index].id,
                                        ),
                                      ),
                                    );
                                  },
                                  leading: const CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                      size: 30,
                                    ),
                                  ),
                                  title:
                                      Text(Search.data[index].username ?? ""),
                                  subtitle: Text(Search.data[index].id ?? ""),
                                  trailing: SizedBox(
                                    height: 35,
                                    width: 90,
                                    // child: CustomRoundButton(
                                    //   title: '',
                                    //   onPress: () {
                                    //     followUserViewModel.followUserApi(
                                    //         Search.data[index].id.toString(),
                                    //         context);
                                    //     // final followUser =
                                    //     //     Provider.of<FollowUserViewModel>(
                                    //     //         context,
                                    //     //         listen: false);
                                    //     // String data =
                                    //     //     Search.data[index].id.toString();
                                    //     // followUser.followUserApi(data, context);
                                    //   },
                                    // ),
                                  ),
                                );
                              },
                            ),
                    );
                  default:
                    return Container();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
