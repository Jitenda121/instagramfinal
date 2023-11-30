import 'package:flutter/material.dart';
import 'package:flutter_application_1/respository/unfollowrepo.dart';
import 'package:flutter_application_1/utils/utils.dart';


class UnFollowViewModel with ChangeNotifier {
  final _myRepo = UnFollowersRepository();

  Future<bool> unfollowuser(dynamic data, BuildContext context) async {
    try {
      if (data.isNotEmpty) {
        await _myRepo.unfollowUsertApi(data);

        Utils.toastMessage("unfollow successfully");
        return true;
      } else {
        // Handle the case where postId is null or empty
        Utils.flashBarErrorMessage('FollowingId is required', context);
      }

      // setLoading(false);
    } catch (error) {
      // setLoading(false);
      debugPrint("Error during delete user post API call: $error");
    }
    return false;
  }
}