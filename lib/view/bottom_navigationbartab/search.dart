import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/explore_grid.dart';
import 'package:flutter_application_1/view_model/viewmodel/User_feeds_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  TextEditingController text = TextEditingController();
  //UserFeedsViewModel userFeedsViewModel = UserFeedsViewModel();
  // @override
  //  void initState() {
  //   debugPrint("in homepage");
  //   userFeedsViewModel.fetchUserfeeds();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            CustomTextField(
                prefixIcon: Icons.search, hintText: "search", controller: text),
            SizedBox(
              height: 10,
            ),
            Expanded(child: ExploreGrid())
          ],
        ));
  }
}
