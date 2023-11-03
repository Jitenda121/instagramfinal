import 'dart:io';

import 'package:flutter/material.dart';

class ImageProviderModel extends ChangeNotifier {
  late File _pickedImage;

  File get pickedImage => _pickedImage;

  void setImage(File image) {
    debugPrint("in provider $image");

    _pickedImage = image;
    notifyListeners();
  }
}
