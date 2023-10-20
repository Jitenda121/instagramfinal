import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
//import 'package:flutter_application_1/view/owner_profile.dart';
//import 'package:flutter_application_1/view/search_page.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
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
    //"Assets/animation_lnrmehdc.json",
    //"Assets/animation_lnr9nmfk.json",
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushNamed(context, RoutesName.search);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SearchPage()));
        break;
      case 2:
        _openCamera();

        break;
      case 3:
        _openGallery();
        break;
      case 4:
        Navigator.pushNamed(context, RoutesName.owner);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => OwnerProfile()));

        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 3,
        centerTitle: false,
        title: const Text(
          "Instagram",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        // backgroundColor: const Color.fromARGB(255, 33, 150, 243),
        //backgroundColor: const Color.fromARGB(255, 84, 164, 229),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "camera",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: "gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "profile",
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
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            )
                          ],
                        ),
                        Container(
                          // color: Colors.blue,
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(image:),
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: AssetImage(post[]))),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(post[index]))),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.chat_bubble_outline),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.label_outline),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border),
                            ),
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

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Handle the captured image (save it, display it, etc.)
    }
  }

  Future<void> _openGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Handle the selected image from the gallery (save it, display it, etc.)
    }
  }
}
