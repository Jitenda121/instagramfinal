import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';
class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  //UserProfileViewModel userProfileViewModel = UserProfileViewModel();
  // @override
  // void initState() {
  //   super.initState();
  //   userProfileViewModel.fetchUserProfile();
  // }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      child: Drawer(
        child: ListView(children: [
          const DrawerHeader(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 130,
                    // child: CircleAvatar(
                    //   radius: 3,
                    //   backgroundColor: Color.fromARGB(31, 153, 153, 154),
                    //   backgroundImage: ImageProvider.
                    // //   backgroundImage:Image.network(
                    // //           value.userProfile.data!.data.userPofile[0]
                    // //               .profilePic
                    // //               .toString(),
                    // // ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            onTap: () {
              //Navigator.pop(context);
              //Navigator.pushNamed(context, RoutesName.homepage);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          const Divider(
            thickness: 5,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text(
              "My profile",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, RoutesName.owner);
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => OwnerProfile()));
            },
          ),
          const Divider(
            thickness: 5,
          ),
          // ListTile(
          //   leading: const Icon(Icons.insert_chart),
          //   title: const Text(
          //     "Analytics",
          //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // const Divider(
          //   thickness: 5,
          // ),
          // ListTile(
          //   leading: const Icon(Icons.notifications),
          //   title: const Text(
          //     "Notifications",
          //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // const Divider(
          //   thickness: 5,
          // ),
          const SizedBox(
            height: 55,
            child: Row(
              children: [
                SizedBox(
                  width: 17,
                ),
                Icon(
                  Icons.g_translate,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 28,
                ),
                Text(
                  "Language",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "Log out",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Logout"),
                    content: const Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                         
                          authViewModel.logout(context);
                        },
                        child: const Text("Logout"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(
            thickness: 5,
          ),
          const SizedBox(
            height: 70,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                "App version 4.18.2(1)",
                style: TextStyle(fontSize: 18),
              )
            ],
          )
        ]),
      ),
    );
  }
}
