import 'package:flutter/material.dart';

class Following extends StatefulWidget {
  const Following({Key? key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  List<String> followersList = [
    'Following 1',
    'Following 2',
    'Following 3',
    'Following 4',
    'Following 5',
    'Following 6',
    'Following 7',
    'Following 8',
    'Following 9',
    'Following 10',
    'Following 11',
    'Following 12',
    'Following 13',
    'Following 14',
    'Following 15',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followings'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: followersList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(followersList[index]),
                    trailing: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Remove Following"),
                              content:
                                  Text("Are you sure you want to log out?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Perform logout logic here
                                    // For example, you can navigate to the login screen
                                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                    setState(() {
                                      followersList.removeAt(index);
                                    });
                                  },
                                  child: Text("Remove"),
                                ),
                              ],
                            );
                          },
                        );

                        // Logic to remove follower from the list
                      },
                      child: Text('Following'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
