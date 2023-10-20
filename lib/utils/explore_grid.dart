import 'package:flutter/material.dart';

class ExploreGrid extends StatefulWidget {
  const ExploreGrid({super.key});

  @override
  State<ExploreGrid> createState() => _ExploreGridState();
}

class _ExploreGridState extends State<ExploreGrid> {
  List<String> searchimage = [
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/images (3).jpeg",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 20,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  //color: Colors.amber,
                  image:
                      DecorationImage(image: AssetImage(searchimage[index]))),

              // color: Colors.grey[300],
            ),
          );
        });
  }
}
