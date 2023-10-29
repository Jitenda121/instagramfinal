import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Gallary extends StatefulWidget {
  const Gallary({Key? key});

  @override
  State<Gallary> createState() => _GallaryState();
}

class _GallaryState extends State<Gallary> {
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _openGallery,
              child: Text('Open Gallery'),
            ),
          ),
          if (_selectedImage != null)
            Image.file(
              File(_selectedImage!.path),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }

  Future<void> _openGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = image;
    });

    if (image != null) {
      // Handle the selected image from the gallery (save it, display it, etc.)
    }
  }
}
