import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/view_model/delete_notification_view_modal.dart';
import 'package:flutter_application_1/view_model/viewmodel/notification_list_view_modal.dart';

import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  DeleteNotificationtViewModel deleteNotificationtViewModel =
      DeleteNotificationtViewModel();

  NotificationlistViewModel notificationlistViewModel =
      NotificationlistViewModel();

  @override
  void initState() {
    super.initState();
   // print("in commentList Page");
    notificationlistViewModel.fetchNotificationlist();
    //print("in Followers 1");
  }

  @override
  Widget build(BuildContext context) {
    // final unFollowUserViewModel = Provider.of<UnFollowUserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Notifications"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // Use the appropriate icon for iOS
            onPressed: () {
              Navigator.of(context)
                  .pop(); // This will navigate back when the button is pressed
            },
          ),
        ),
        body: ChangeNotifierProvider<NotificationlistViewModel>(
            create: (BuildContext context) => notificationlistViewModel,
            child: Consumer<NotificationlistViewModel>(
                builder: (context, value, _) {
              switch (value.listList.status) {
                case Status.Loading:
                  debugPrint("hello");
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                case Status.Error:
                  return Text(value.listList.message.toString());
                case Status.Success:
                  debugPrint("Success");
                  final notifications = value.listList.data;
                  return SizedBox(
                    child: notifications!.data.isEmpty
                        ? const Center(
                            child: Text("No  New Notification "),
                          )
                        : ListView.builder(
                            itemCount: notifications.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {},
                                leading: CircleAvatar(
                                  child: value.listList.data!.data[index]
                                              .image !=
                                          null
                                      ?
                                      ClipOval(
                                          child: Image.network(
                                            value.listList.data!.data[index]
                                                .image,
                                           
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        )
                                      : const Icon(
                                          Icons.person,
                                          size: 30,
                                        ),
                                ),
                                title: RichText(
                                  text: TextSpan(
                                    text:
                                        notifications.data[index].message ?? "",
                                    style: const TextStyle(
                                      color: Colors
                                          .black, // You can set the color as per your requirement
                                      fontSize:
                                          16, // You can set the font size as per your requirement
                                      fontWeight: FontWeight
                                          .bold, // You can set the font weight as per your requirement
                                    ),
                                    // You can add more TextSpans here with different styles if needed
                                  ),
                                ),
                              
                                trailing: InkWell(
                                    onTap: () {
                                      showReportConfirmationDialog(
                                          context,
                                          notifications.data[index].id
                                              .toString());
                                    },
                                    child: const Icon(Icons.delete)),
                              );
                            }),
                  );
                default:
                  return Container();
              }
            })));
  }

  Future<void> showReportConfirmationDialog(
      BuildContext context, String notificationId) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure to delete  "),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
                //reportPostViewModel.reportPostApi(postId, context);
              },
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                deleteNotificationtViewModel.deleteNotificationtApi(
                    notificationId, context);
                notificationlistViewModel.fetchNotificationlist();
              },
            )
          ],
        );
      },
    );
  }
}
