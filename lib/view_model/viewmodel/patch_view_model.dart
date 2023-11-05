import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/editprofile_repo.dart';
import 'package:flutter_application_1/utils/utils.dart';

class EditViewModel with ChangeNotifier{
 final _myRepo = EditProfileRepository();
  Future<void> editProfileApi(dynamic data, BuildContext context) async {
    _myRepo.editProfileApi(data).then((_) {
      Utils.toastMessage('Profile edited successfully');
    }).onError((error, stackTrace) {
      Utils.flashBarErrorMessage('Error editing profile: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

// class EditViewModel with ChangeNotifier {
//   final _myRepo = EditProfileRepository();

//   Future<bool> editProfileApi(dynamic data, BuildContext context) async {
//     try {
//       await _myRepo.editProfileApi(data);
//       Utils.toastMessage('Profile edited successfully');
//       return true;
//     } catch (error) {
//       Utils.flashBarErrorMessage('Error editing profile: $error', context);
//       if (kDebugMode) {
//         print(error.toString());
//       }
//       return false;
//     }
//   }
// }
