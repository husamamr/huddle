import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/color_constant.dart';
import './place_details.dart';
import './place_events.dart';
class BottomBarBO extends StatefulWidget {
   BottomBarBO();

  @override
  State<BottomBarBO> createState() => _BottomBarBOState();
}

class _BottomBarBOState extends State<BottomBarBO> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    PlaceDetails(),
    CreateEvent(),
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
      backgroundColor: ColorConstant.gray50,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.place,size: 35),
            label: ('Establishment'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.celebration,size: 35),
            label: 'Events',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorConstant.blueGray900,
        selectedLabelStyle: GoogleFonts.poppins(),
        unselectedLabelStyle: GoogleFonts.poppins(),
        onTap: _onItemTapped,
      ),
    );
  }
}
