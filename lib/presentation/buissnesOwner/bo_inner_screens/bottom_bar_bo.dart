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
      floatingActionButton:_selectedIndex == 1 ? FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              String eventName = '';
              String fromTime = '';
              String toTime = '';
              String dayData = '';
              String aboutEvent = '';
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return AlertDialog(
                    title: const Text('Are You Sure to Confirm?'),
                    content: SingleChildScrollView(
                      child: SizedBox(
                        height: 320,
                        width: 700,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Event Name'),
                              onChanged: (value) {
                                setState(() {
                                  eventName = value;
                                });
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'From Time'),
                              onChanged: (value) {
                                setState(() {
                                  fromTime = value;
                                });
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'To Time'),
                              onChanged: (value) {
                                setState(() {
                                  toTime = value;
                                });
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Day Data'),
                              onChanged: (value) {
                                setState(() {
                                  dayData = value;
                                });
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'About Event'),
                              maxLines: null,
                              onChanged: (value) {
                                setState(() {
                                  aboutEvent = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (eventName.isEmpty ||
                              fromTime.isEmpty ||
                              toTime.isEmpty ||
                              dayData.isEmpty ||
                              aboutEvent.isEmpty) {
                            // Show an error message or handle empty fields as needed
                            return;
                          }

                          // All fields are filled, print the form data
                          print('Event Name: $eventName');
                          print('From Time: $fromTime');
                          print('To Time: $toTime');
                          print('Day Data: $dayData');
                          print('About Event: $aboutEvent');

                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );

        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ) : null,
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
