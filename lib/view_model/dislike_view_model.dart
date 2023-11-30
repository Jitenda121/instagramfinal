
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/respository/dislike_repository.dart';
// import 'package:flutter_application_1/utils/utils.dart';

// class DisLikePostViewModel with ChangeNotifier {
//   final _myRepo = DisLikePostRepository();

//   Future<void> DisLikePostApi(dynamic data, BuildContext context) async {
//     debugPrint("Like user api call 2");
//     _myRepo.DisLikePost(data).then((value) {
//       debugPrint("like user api call 2 Success");

//       Utils.toastMessage('Dislike  successful');

//       if (kDebugMode) {
//       }
//     }).onError((error, stackTrace) {
//       //  setsignupLoading(false);

//       Utils.flashBarErrorMessage(error.toString(), context);
//       if (kDebugMode) {
//         debugPrint("like user api call 2 error");
//         Utils.flashBarErrorMessage(error.toString(), context);
//         print(error.toString());
//       }
//     });
//   }
// }


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/dislike_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';


class DisLikePostViewModel with ChangeNotifier {
  final _myRepo = DisLikePostRepository();

  Future<bool> DisLikePostApi(dynamic data, BuildContext context) async {
    debugPrint("Dislike user api call");
    try {
      final result = await _myRepo.DisLikePost(data);
      debugPrint("Dislike user api call Success");
      Utils.toastMessage('Dislike successful');
      return true;
    } catch (error, stackTrace) {
      Utils.flashBarErrorMessage(error.toString(), context);
      debugPrint("Dislike user api call error");
      Utils.flashBarErrorMessage(error.toString(), context);
      print(error.toString());
      return false;
    }
  }
}
