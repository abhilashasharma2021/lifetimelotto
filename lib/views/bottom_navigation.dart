import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifetimelotto/views/profile.dart';
import 'home.dart';
import 'mycards.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);


  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        children: [
          new Home(),
          new MyCards(),
          new Profile(),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),

      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: const Color(0xFF4E5FED),

        ), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          selectedIconTheme: IconThemeData(color: Colors.white, size: 25),
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,

                ),
                label: 'Home'),
            new BottomNavigationBarItem(
                icon:ImageIcon(AssetImage("assets/cards.png")),
                label: 'My Cards'),
            new BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/people.png")),
                label: 'People'
            )
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}


