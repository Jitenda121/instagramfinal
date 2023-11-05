import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/unfollowrepo.dart';
import 'package:flutter_application_1/utils/utils.dart';
//import 'package:instragram_clone/respository/unfollow_repository.dart';
//import 'package:instragram_clone/utils/toastMessage.dart';

class UnFollowViewModel with ChangeNotifier {
  final _myRepo = UnFollowersRepository();

  Future<void> unfollowuser(dynamic data, BuildContext context) async {
    try {
      if (data.isNotEmpty) {
   
        await _myRepo.unfollowUsertApi(data);

        Utils.toastMessage("unfollow successfully");

      
      } else {
        // Handle the case where postId is null or empty
        Utils.flashBarErrorMessage('FollowingId is required', context);
      }

      // setLoading(false);
    } catch (error) {
      // setLoading(false);
      debugPrint("Error during delete user post API call: $error");
    }
  }
}