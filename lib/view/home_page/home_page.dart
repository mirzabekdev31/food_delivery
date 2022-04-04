import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/color/app_color.dart';
import 'package:food_delivery/view/home_page/like_page.dart';
import 'package:food_delivery/view/home_page/my_profil_page.dart';

import 'home_page_item_home.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id="home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late PageController _pageController;
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomePageItem(),
          LikePage(),
          MyPrfilPage()
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int index) {
          _currentTab = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        currentIndex: _currentTab,
        activeColor: AppColor.activeColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/forward.png")
              ),
              label: "Chats"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/user.png")
              ),
              label: "My post"),
        ],
      ),
    );
  }
}
