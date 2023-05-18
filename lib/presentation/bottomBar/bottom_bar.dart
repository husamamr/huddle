import 'package:flutter/material.dart';
import 'package:huddle/presentation/GroupsScreens/group_screen_home.dart';
import 'package:huddle/presentation/HomeScreen/home_screen.dart';
import 'package:huddle/presentation/SearchScreen/search_screen.dart';

class BottomBar extends StatefulWidget {
  BottomBar();

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    HomeScreen(),
    GroupScreen(),
    SearchScreen()
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups,size: 35),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, size: 35),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }
}
