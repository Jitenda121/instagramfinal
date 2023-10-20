import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  //final favoriteProvider = Provider.of<FavoriteProvider>(context,listen:false );
  Widget build(BuildContext context) {
    // final favoriteProvider =
    //     Provider.of<FavoriteProvider>(context, listen: false);

    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("favourite Screen"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavourite()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                          //value.addItem(index);
                        },
                        title: Text('item' + index.toString()),
                        trailing: Icon(value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
