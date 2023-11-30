import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/aws.dart';
import 'package:flutter_application_1/provider/home_view_model.dart';
import 'package:flutter_application_1/res/colors.dart';
import 'package:flutter_application_1/res/component/round_button.dart';

import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  //File? pickedImage;
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;
//
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final authViewModel = Provider.of<AuthViewModel>(context);
    // final ImageUpload imageUpload = ImageUpload();

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 3,
            title: Text(
              "CREATE POST",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.applelogin,
              ),
            ),
            //
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: _isLoading
                  ? const LinearProgressIndicator(
                      color: Colors.red,
                    )
                  : const PreferredSize(
                      preferredSize: Size.zero, child: SizedBox()),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo),
                              title: const Text('Pick from Gallery'),
                              onTap: () {
                                _pickImageFromGallery();
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Take a Photo'),
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
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: _pickedImage != null
                        ? Image.file(
                            _pickedImage!,
                            fit: BoxFit.cover,
                          )
                        : const Center(
                            child: Icon(
                              Icons.camera,
                              size: 60,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Write What's on Your Mind"),
                    controller: searchController,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomRoundButton(
                  title: "Post",
                  onPress: () async {
                    if (searchController.text.isEmpty || _pickedImage == null) {
                      return;
                    }
//
                    setState(() {
                      _isLoading = true;
                    });

                    try {
                      Uint8List imageData = await _pickedImage!.readAsBytes();
                      final String? imageUrl =
                          await ImageUpload().uploadImageWeb(imageData);
                      debugPrint('image URL: $imageUrl');

                      if (imageUrl != null) {
                        Map<String, dynamic> data = {
                          "url": imageUrl,
                          "mediaType": "image",
                          "caption": searchController.text.toString(),
                        };
                        debugPrint("api hit");
                        // ignore: use_build_context_synchronously
                        await authViewModel.createPost(data, context);
                        final homeProvider =
                            // ignore: use_build_context_synchronously
                            Provider.of<HomeViewModel>(context, listen: false);
                        homeProvider.setIndex(0);
                      }
                    } 
                    catch (error) {
                      // print(error);
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        _isLoading
            ? ModalBarrier(
                color: Colors.black.withOpacity(0.3),
                dismissible: false,
              )
            : const SizedBox(),
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
