import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
//import 'package:flutter_application_1/view/bottom_navigationbartab.dart/account.dart';
import 'package:flutter_application_1/view/bottom_navigationbartab/account.dart';
import 'package:lottie/lottie.dart';
////import 'package:flutter_application_1/view/tab1home/account.dart';

import '../view_model/viewmodel/custom_text.dart';
//import 'owner_profile.dart';
//import 'package:instragram_clone/view/owner_profile_screen.dart';
//import 'package:instragram_clone/view_model/widget/custom.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController usernamcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close)),
        centerTitle: false,
        //leading: back,
        title: Text("Edit Profile"),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm changes"),
                    content:
                        Text("Are you sure you want to save your changes?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Perform logout logic here
                          // For example, you can navigate to the login screen
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OwnerProfile())); // Close the dialog
                        },
                        child: Text("save"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(
              Icons.check,
              color: Colors.blue,
            ),
          )
          //Icon(Icons.wrong_location),
          // Icon(
          // // Icon(Icons.check) as IconData?,
          // //I//cons.open,
          // color: Colors.blue,
          // )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/images (1).jpeg"))
            ],
          ),
          Text(
            "Edit picture or avatar",
            style: TextStyle(fontSize: 20),
          ),
          // TextField(),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomTextField(
                prefixIcon: Icons.account_box,
                hintText: "search",
                controller: usernamcontroller,
              ))
        ],
      ),
    );
  }
}
