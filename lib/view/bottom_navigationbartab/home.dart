import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/bottommodalsheet/bottommodalsheet.dart';
import 'package:flutter_application_1/view/comment.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List<bool> isFavoriteList = List.generate(8, (index) => false);

  bool isFavorite = false;
  List<String> profileImages = [
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
    "images/images (1).jpeg",
  ];
  List<String> post = [
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
    "images/anime.png",
  ];
  List<String> profilepost = [
    "images/images (4).jpeg",
    "images/images (4).jpeg",
    "images/images (4).jpeg",
    "images/images (4).jpeg",
    "images/images (4).jpeg",
    "images/images (4).jpeg",
    "images/images (4).jpeg",
    "images/images (4).jpeg",
  ];
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 3,
        centerTitle: false,
        title: const Text(
          "Instagram",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: 30,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          // backgroundColor: Colors.orangeAccent,
                          radius: 38,
                          backgroundImage: AssetImage(profileImages[index]),
                          // You can set backgroundImage here
                          //backgroundImage: Image.asset(""), // Replace imageUrl with your data property
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue,
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.green,
                                  backgroundImage:
                                      AssetImage(profilepost[index]),
                                ),
                              ),
                            ),
                            const Text(
                              "Profile data",
                              style: TextStyle(fontSize: 20),
                            ),
                            const Spacer(),
                            // IconButton(
                            //   onPressed: () {

                            //   },
                            //   icon: const Icon(Icons.more_vert),
                            // )
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Report"),
                                      content: Text(
                                          "Do you want to report this Post?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text("Cancel"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Report"),
                                          onPressed: () {
                                            // Add logic to handle report action here
                                            // You can perform the necessary actions when the user reports the content
                                            Navigator.of(context)
                                                .pop(); // Close the dialog box
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.more_vert),
                            )
                          ],
                        ),
                        Container(
                          // color: Colors.blue,
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(post[index]))),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavoriteList[index] = !isFavoriteList[
                                      index]; // Toggle the favorite state
                                });
                                // AuthViewModel authViewModel =
                                //     Provider.of<AuthViewModel>(context,
                                //         listen: false);

                                // Call the postLike function from AuthViewModel passing the post ID or index
                                //String likeindex = isFavoriteList.toString();
                                debugPrint("Api hit");
                                //debugPrint(likeindex + "@@@@@@@@@@@");
                                //authViewModel.postLike(likeindex, context);
                              },

                              icon: Icon(
                                isFavoriteList[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavoriteList[index]
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              // icon: const Icon(Icons.favorite_border),
                            ),

                            IconButton(
                              onPressed: () {
                                _showBottomSheet(context);
                              },
                              icon: Icon(Icons.chat_bubble_outline),
                            ),

                            // IconButton(
                            //   onPressed: () {
                            //   },
                            //   icon: const Icon(Icons.chat_bubble_outline),
                            // ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(text: "Liked By"),
                                    TextSpan(
                                      text: " Profile name",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: " and"),
                                    TextSpan(
                                      text: " others",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(text: " Profile name"),
                                    TextSpan(
                                      text:
                                          " This is the most amazing picture ever put on Instagram",
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                "View all others",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return YourBottomSheetWidget(); // Replace YourBottomSheetWidget() with your actual bottom sheet widget.
    },
  );
}
}
