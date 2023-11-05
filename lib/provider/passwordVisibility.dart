import 'package:flutter/material.dart';

class PasswordVisibility {
  bool isPassword1Visible = false;
  bool isPassword2Visible = false;
}

class PasswordVisibilityNotifier extends ChangeNotifier {
  PasswordVisibility _passwordVisibility = PasswordVisibility();

  bool get isPassword1Visible => _passwordVisibility.isPassword1Visible;
  bool get isPassword2Visible => _passwordVisibility.isPassword2Visible;

  void togglePassword1Visibility() {
    _passwordVisibility.isPassword1Visible = !_passwordVisibility.isPassword1Visible;
    notifyListeners();
  }

  void togglePassword2Visibility() {
    _passwordVisibility.isPassword2Visible = !_passwordVisibility.isPassword2Visible;
    notifyListeners();
  }
}