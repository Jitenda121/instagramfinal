// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/respository/like_repository.dart';
// import 'package:flutter_application_1/utils/utils.dart';
// import 'package:flutter_application_1/view_model/viewmodel/User_feeds_model.dart';


// class LikePostViewModel with ChangeNotifier {
//   final _myRepo = LikePostRepository();

//   Future<void> LikePostApi(dynamic data, BuildContext context) async {
   
//     debugPrint("Like user api call 2");
//     _myRepo.LikePost(data).then((value)  {
//       debugPrint("like user api call 2 Success");
     

//       Utils.flashBarErrorMessage('like  successful', context);
//       // UserFeedsViewModel userFeedsViewModel = UserFeedsViewModel();
//       // await userFeedsViewModel.fetchUserfeeds();
//       if (kDebugMode) {
//         //print(value.toString());
//       }
//     }).onError((error, stackTrace) {
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
import 'package:flutter_application_1/respository/like_repository.dart';
import 'package:flutter_application_1/utils/utils.dart';

class LikePostViewModel with ChangeNotifier {
  final _myRepo = LikePostRepository();

  Future<bool> LikePostApi(
    dynamic data,
    BuildContext context,
  ) async {
    try {
      debugPrint("Like user api call 2");
      final value = await _myRepo.LikePost(data);
      debugPrint("like user api call 2 Success");

      Utils.toastMessage('like  successful');
      notifyListeners();

      if (kDebugMode) {
        // print(value.toString());
      }
      return true;
    } catch (error, stackTrace) {
      // setsignupLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        debugPrint("like user api call 2 error");
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
      return false;
    }
  }
}