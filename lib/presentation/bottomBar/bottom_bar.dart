import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huddle/presentation/GroupsScreens/group_screen_home.dart';
import 'package:huddle/presentation/HomeScreen/home_screen.dart';
import 'package:huddle/presentation/SearchScreen/search_screen.dart';

import '../../core/utils/color_constant.dart';
import '../EventsScreen/events_screen.dart';
import '../floatingActionButton/floatingButton.dart';

class BottomBar extends StatefulWidget {
  BottomBar();

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final PageController _pageController = PageController();
  final TextEditingController joinGroupController = TextEditingController();
  final TextEditingController createGroupController = TextEditingController();
  final List<Widget> _screens = [
    HomeScreen(),
    GroupScreen(userID: ""),
    SearchScreen(),
    // EventsScreen()
  ];


  Future<void> createGroup() async{
    String userId = "b754ca40-77fa-ed11-9621-9828a648856e";
    Map <String,dynamic> param = new Map<String,dynamic>();
    param['userId'] = userId;
    param['GroupName'] = createGroupController.text.toString();
    String url = "https://localhost:7167/api/Groups/CreateGroup/?userId=$userId&GroupName=${createGroupController.text.toString().trim()}";
    final dio = Dio();
    final response = await dio.post(url,
        options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
    );
    if(response.data['isSuccess']) {
    }
    else{
       print(response.data['errors']);
    }
  }

  Future<void> joinGroup() async{
    String userId = "52bba37b-78fa-ed11-9621-9828a648856e";
    Map <String,dynamic> params = new Map<String,dynamic>();
    String url = "https://localhost:7167/api/Groups/AddConsumerToGroup/?userId=$userId&hashNum=${joinGroupController.text.toString().trim()}";
    params['userId'] = userId;
    params['hashNum'] = joinGroupController.text;
    final dio = Dio();
    final response = await dio.post(url,
        options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}));
    if(response.data['isSuccess']) {
      print("success");
    }
    else{
      print( response.data['errors']);
    }
  }


  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: _selectedIndex == 1 ? ExpandableFab(
        distance: 112.0,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: screenHeight * 0.08,
                    child: AlertDialog(
                      title: Text('Create New Group '),
                      content: TextField(
                      controller: createGroupController,
                      decoration: InputDecoration(
                          hintText: 'Group name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black),
                          )
                      ),
                    ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            createGroupController.clear();
                            Navigator.of(context).pop();},
                          child: const Text('CLOSE'),
                        ),
                        TextButton(
                          onPressed: () {
                            createGroup();
                            createGroupController.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text('SAVE'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.create_new_folder_rounded),
          ),
          FloatingActionButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: screenHeight * 0.08,
                    child: AlertDialog(
                      title: Text("Join Group"),
                      content: TextField(
                        controller: joinGroupController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: '#groupnumber',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            )
                        ),
                      ),
                      actions: [

                        TextButton(
                          onPressed: () {
                            joinGroupController.clear();
                            Navigator.of(context).pop();},
                          child: const Text('CLOSE'),
                        ),
                        TextButton(

                          onPressed: () {

                            joinGroup();
                            joinGroupController.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text('SAVE'),
                        ),

                      ],
                  ));
                },
              );
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.group_add),
          ),
        ],
      ): null,
      backgroundColor: ColorConstant.gray50,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home,size: 35),
      //       label: ('Home'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.groups,size: 35),
      //       label: 'Groups',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search_rounded, size: 35),
      //       label: 'Search',
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(Icons.celebration, size: 35),
      //     //   label: 'Events',
      //     // ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: ColorConstant.blueGray900,
      //   selectedLabelStyle: GoogleFonts.poppins(),
      //   unselectedLabelStyle: GoogleFonts.poppins(),
      //   onTap: _onItemTapped,
      // ),

      bottomNavigationBar: BottomAppBar(
        color:  Colors.white,
        notchMargin: 0,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =  HomeScreen();
                    _selectedIndex = 0;
                  });
                },
                //Updated
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.home,
                        size: 35,
                        color: _selectedIndex == 0 ? Colors.black : Colors.grey
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: _selectedIndex == 0 ? Colors.black : Colors.grey),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =  HomeScreen();
                    _selectedIndex = 1;
                  });
                },
                //Updated
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.groups,
                        size: 35,
                        color: _selectedIndex == 1 ? Colors.black : Colors.grey
                    ),
                    Text(
                      "Groups",
                      style: TextStyle(color: _selectedIndex == 1 ? Colors.black : Colors.grey),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =  HomeScreen();
                    _selectedIndex = 2;
                  });
                },
                //Updated
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.search_rounded,
                        size: 35,
                        color: _selectedIndex == 2 ? Colors.black : Colors.grey
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: _selectedIndex == 2 ? Colors.black : Colors.grey),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =  HomeScreen();
                    _selectedIndex = 3;
                  });
                },
                //Updated
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.celebration,
                        size: 35,
                        color: _selectedIndex == 3 ? Colors.black : Colors.grey
                    ),
                    Text(
                      "Events",
                      style: TextStyle(color: _selectedIndex == 3 ? Colors.black : Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
