import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/aws.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/view_model/user_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';
import 'package:flutter_application_1/view_model/viewmodel/patch_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final Map useData;
  const EditProfile({
    super.key,
    required this.useData,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  EditViewModel editprofile = EditViewModel();
  // UserProfileViewModel userProfileViewModel = UserProfileViewModel();

  bool _isLoading = false;
  UserProfileViewModel userProfileViewModel = UserProfileViewModel();

  @override
  void dispose() {
    fullNameController.dispose();
    biocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editProfile = Provider.of<EditViewModel>(context);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "Edit Profile",
              style: TextStyle(color: Colors.black),
            ),
            leading: GestureDetector(
              onTap: () {
               userProfileViewModel.fetchUserProfile();
                Navigator.pop(context);
               // userProfileViewModel.fetchUserProfile();
              },
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: _isLoading
                  ? LinearProgressIndicator(
                      color: Colors.red,
                    )
                  : PreferredSize(child: SizedBox(), preferredSize: Size.zero),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.photo),
                              title: Text('Pick from Gallery'),
                              onTap: () {
                                _pickImageFromGallery();
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.camera),
                              title: Text('Take a Photo'),
                              onTap: () {
                                _pickImageFromCamera();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  padding: const EdgeInsets.all(0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 80,
                    backgroundImage:
                        _pickedImage != null ? FileImage(_pickedImage!) : null,
                    child: _pickedImage == null
                        ? Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 80,
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  prefixIcon: Icons.account_box,
                  hintText: "Full Name",
                  controller: fullNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  prefixIcon: Icons.account_box,
                  hintText: "Bio",
                  controller: biocontroller,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomRoundButton(
                  title: "Save changes",
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                              "Are you sure you want to make changes?"),
                          actions: [
                            TextButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CustomRoundButton(
                              title: "Yes,Save changes",
                              onPress: () async {
                                setState(() {
                                  _isLoading = true;
                                });

                                Navigator.pop(context);
                                Uint8List imageData =
                                    await _pickedImage!.readAsBytes();
                                final String? imageUrl = await ImageUpload()
                                    .uploadImageWeb(imageData);
                                debugPrint('image URL: $imageUrl');
                                Map<String, dynamic> data = {
                                  "fullName":
                                      fullNameController.text.toString() == ""
                                          ? widget.useData["name"]
                                          : fullNameController.text.toString(),
                                  "profilePic": imageUrl == null
                                      ? widget.useData["pic"]
                                      : imageUrl,
                                  "profileBio":
                                      biocontroller.text.toString() == ""
                                          ? widget.useData["bio"]
                                          : biocontroller.text.toString(),
                                };
                                debugPrint("api hit");
                                await editProfile.editProfileApi(data, context);
                                setState(() {
                                  _isLoading = false;
                                });

                                // final edit = Provider.of<UserProfileViewModel>(
                                //     context,
                                //     listen: false);
                                // edit.fetchUserProfile();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        if (_isLoading)
          ModalBarrier(
            color: Colors.black.withOpacity(0.3),
            dismissible: false,
          ),
      ],
    );
  }

  Future<void> _pickImageFromGallery() async {
    XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }
}
