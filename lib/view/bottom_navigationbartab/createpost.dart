import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/network/aws.dart';
import 'package:flutter_application_1/provider/home_view_model.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
//import 'package:flutter_application_1/view/homepage.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  //File? pickedImage;
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;
  
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final authViewModel = Provider.of<AuthViewModel>(context);
    final ImageUpload imageUpload = ImageUpload();

    return Stack(
      children: [
        Scaffold(
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(4.0),
              child: _isLoading
                  ? LinearProgressIndicator(
                      color: Colors.red,
                    )
                  : PreferredSize(child: SizedBox(), preferredSize: Size.zero),
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
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.95,
                //   child: TextFormField(
                //     decoration:
                //         InputDecoration(hintText: "Write What's on Your Mind"),
                //     controller: searchController,
                //   ),
                // ),
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
                    // final XFile? pickedFile = await ImagePicker()
                    //     .pickImage(source: ImageSource.gallery);
                    // if (pickedFile != null) {
                    //   setState(() {
                    //     pickedImage = File(pickedFile.path);
                    //   });
                    // }
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child:
                     _pickedImage != null
                        ? Image.file(_pickedImage!)
                        : Center(
                            child: Text('Tap to pick an image'),
                          ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
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
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomRoundButton(
                  title: "Post",
                  onPress: () async {
                    if (searchController.text.isEmpty || _pickedImage == null) {
                      
                      return;
                    }

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
                        await authViewModel.createPost(data, context);
                        final homeProvider =
                            Provider.of<HomeViewModel>(context, listen: false);
                        homeProvider.setIndex(0);
                      }
                    } catch (error) {
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
            : SizedBox(),
      ],
    );
  }
  //final ImagePicker _imagePicker = ImagePicker();
  //File? _pickedImage;

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
