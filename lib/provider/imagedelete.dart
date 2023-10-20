import 'dart:io';

import 'package:flutter/material.dart';

class ImageProviderModel extends ChangeNotifier {
  File? _pickedImage;

  File? get pickedImage => _pickedImage;

  void setImage(File? image) {
    _pickedImage = image;
    notifyListeners();
  }

  void clearImage() {
    _pickedImage = null;
    notifyListeners();
  }
}