import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  List<String> postimage1 = [
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (4).jpeg"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: MasonryGridView.builder(
          itemCount: 10,
          crossAxisSpacing: 2,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      // color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(postimage1[index]))),
                  //color: Colors.blue,
                  height: 150,
                  //width: 20,
                ),
              )),
    );
  }
}
