import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:instragram_clone/res/component/elevatedbutton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? pickedImage; // Variable to store the picked image file

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 3,
        title: Text(
          "CREATE POST",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: "Write What's on Your Mind"),
                controller: searchController,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              onTap: () async {
                final XFile? pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    pickedImage = File(pickedFile.path);
                  });
                }
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.9,
                child: pickedImage != null
                    ? Image.file(pickedImage!)
                    : Center(
                        child: Text('Tap to pick an image'),
                      ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomRoundButton(
                title: "Post",
                onPress: () {
                  Map data = {
                    "url":
                        "https://images.unsplash.com/photo-1477948879622-5f16e220fa42?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "mediaType": "image",
                    "caption": searchController.text.toString()
                  };
                  debugPrint("api hit");
                  authViewModel.createPost(data, context);
                })
          ],
        ),
      ),
    );
  }
}
