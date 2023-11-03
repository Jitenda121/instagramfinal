import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/home_view_model.dart';
import 'package:flutter_application_1/view/bottom_navigationbartab/account.dart';
import 'package:flutter_application_1/view/bottom_navigationbartab/createpost.dart';
import 'package:flutter_application_1/view/bottom_navigationbartab/gallary.dart';
import 'package:flutter_application_1/view/bottom_navigationbartab/home.dart';
import 'package:flutter_application_1/view/bottom_navigationbartab/search.dart';
import 'package:flutter_application_1/view_model/viewmodel/User_feeds_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<bool> isFavoriteList = List.generate(value., (index) => false);
  UserFeedsViewModel userFeedsViewModel = UserFeedsViewModel();

  final List<Widget> _pages = [
    const Home_page(),
    const Search_Page(),
    const CreatePost(),
    //const Gallary(),
    const OwnerProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    debugPrint("---------------------%--------------------");
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          return _pages[homeViewModel.selectedIndex];
        },
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: Provider.of<HomeViewModel>(context).selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        Provider.of<HomeViewModel>(context, listen: false).setIndex(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "CreatePost",
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.image),
        //   label: "Gallery",
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
