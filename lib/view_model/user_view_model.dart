// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/model/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';

// class UserViewModel with ChangeNotifier {
//   Future<bool> saveUser(UserModel user) async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('token', user.Token.toString());
//     sp.setString('token', user.username.toString());
//     notifyListeners();
//     return true;
//   }

//   Future<UserModel> getUser() async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     final String? token = sp.getString('token');

//     return UserModel(Token: token.toString());

//     //void remove
//   }

//    Future<bool> remove() async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//sp.remove('token');
//return true;
//      return sp.clear();
//   }
// }
