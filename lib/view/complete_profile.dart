// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/provider/imagedelete.dart';
// import 'package:flutter_application_1/res/component/app_images.dart';
// import 'package:flutter_application_1/res/component/round_button.dart';
// import 'package:flutter_application_1/utils/routes/routes_name.dart';
// import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';

// class CompleteProfile extends StatefulWidget {
//   const CompleteProfile({
//     super.key,
//   });

//   @override
//   State<CompleteProfile> createState() => _CompleteProfileState();
// }

// class _CompleteProfileState extends State<CompleteProfile> {
//   File? pickedImage;
//   TextEditingController fullNameController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     fullNameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text(
//           "Complete Profile",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//             child: ListView(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CupertinoButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.vertical(top: Radius.circular(20.0)),
//                       ),
//                       builder: (BuildContext context) {
//                         return Container(
//                           height: 300,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     height: 7,
//                                     width: 50,
//                                     decoration: BoxDecoration(
//                                       color: Colors.grey,
//                                       borderRadius: BorderRadius.circular(50),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 40,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20.0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Profile photo",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 200,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         clear();
//                                       },
//                                       child: Icon(
//                                         Icons.delete,
//                                         size: 30,
//                                         color: Colors.grey,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 40.0),
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       children: [
//                                         CircleAvatar(
//                                           radius: 40,
//                                           backgroundColor: Colors.blue,
//                                           child: CircleAvatar(
//                                             backgroundColor: Colors.white,
//                                             child: InkWell(
//                                               onTap: () async {
//                                                 Navigator.pop(context);
//                                                 getImage(ImageSource.camera);
//                                               },
//                                               child: Icon(
//                                                 Icons.camera_alt,
//                                                 size: 30,
//                                                 color: Colors.blue,
//                                               ),
//                                             ),
//                                             radius: 39,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           "Camera",
//                                           style: TextStyle(fontSize: 20),
//                                         )
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 50,
//                                     ),
//                                     Column(
//                                       children: [
//                                         CircleAvatar(
//                                           radius: 40,
//                                           backgroundColor: Colors.blue,
//                                           child: CircleAvatar(
//                                             backgroundColor: Colors.white,
//                                             child: InkWell(
//                                               onTap: () async {
//                                                 getImage(ImageSource.gallery);
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Icon(
//                                                 Icons.image,
//                                                 size: 30,
//                                                 color: Colors.blue,
//                                               ),
//                                             ),
//                                             radius: 39,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           "Gallery",
//                                           style: TextStyle(fontSize: 20),
//                                         )
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 50,
//                                     ),
//                                     Column(
//                                       children: [
//                                         CircleAvatar(
//                                           radius: 40,
//                                           backgroundColor: Colors.blue,
//                                           child: CircleAvatar(
//                                             backgroundColor: Colors.white,
//                                             child: InkWell(
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Icon(
//                                                 Icons.cancel,
//                                                 size: 33,
//                                                 color: Colors.blue,
//                                               ),
//                                             ),
//                                             radius: 39,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           "Cancel",
//                                           style: TextStyle(fontSize: 20),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   padding: EdgeInsets.all(0),
//                   child: Consumer<ImageProviderModel>(
//                     builder: (context, imageProvider, child) {
//                       return CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 100,
//                         backgroundImage: imageProvider.pickedImage != null
//                             ? FileImage(imageProvider.pickedImage!)
//                             : null,
//                         child: imageProvider.pickedImage == null
//                             ? LottieBuilder.asset(AppImage.circleavatarimage)
//                             : null,
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 CustomTextField(
//                   prefixIcon: Icons.account_box,
//                   hintText: "Full Name",
//                   controller: fullNameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Full Name cannot be empty";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomRoundButton(
//                   title: "Submit",
//                   onPress: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Validated, proceed with your logic
//                       Navigator.pushNamed(context, RoutesName.homepage);
//                     }
//                   },
//                 ),
//                 Container(child: Lottie.asset(AppImage.completeprofileimage)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> getImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;

//       final imageTemporary = File(image.path);
//       Provider.of<ImageProviderModel>(context, listen: false)
//           .setImage(imageTemporary);
//     } on PlatformException {
//       print("Failed to pick image");
//     }
//   }

//   // void clear() {
//   //   pickedImage = null;
//   //   Provider.of<ImageProviderModel>(context, listen: false).clearImage();
//   // }
// }
