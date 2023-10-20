import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider1 with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signup(String username, String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(
        Uri.parse("https://pranavsocial.appskeeper.in/api/v1/user/signup"),
        body: {
          'username': username,
          'email': email,
          'password': password,
          //'username': username,
        },
      );
      if (response.statusCode == 200) {
        print("Signup successful");
        setLoading(false);
      } else {
        setLoading(false);
        print("Signup failed");
      }
    } catch (e) {
      setLoading(false);
      print("Error during signup: $e");
    }
  }
}
