import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/explore_grid.dart';
import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';
//import 'package:instragram_clone/utils/explore_grid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: ClipRRect(
        //     borderRadius: BorderRadius.circular(8),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(20),
        //           color: Colors.grey[300]),
        //       padding: EdgeInsets.all(8),
        //       //color: Colors.grey[300],
        //       child: Row(
        //         children: [
        //           // Text("Search"),
        //           Icon(
        //             Icons.search,
        //             // color: Colors.grey,
        //           ),
        //           Text("Search"),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        body: Column(
          children: [
            CustomTextField(
                prefixIcon: Icons.search, hintText: "search", controller: text),
            Expanded(child: ExploreGrid())
          ],
        ));
    //return
  }
}
