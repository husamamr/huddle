import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/color_constant.dart';
import '../../../data/text_field_time_picker.dart';
import '../../../text_field_date_picker.dart';
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
          final _formKey = GlobalKey<FormState>();
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
                        height: 450,
                        width: 700,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Event Name'),
                                onChanged: (value) {
                                  setState(() {
                                    eventName = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field is required";
                                  }
                                },
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                width: 600,
                                child: TextFieldTimePicker(
                                  fullWidth: false,
                                  suffixIcon: Icon(Icons.access_time),
                                  labelText: "From Time",
                                  initialTime: null,
                                  validatorCallBack: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  onTimeChanged: (value) {
                                    fromTime = value == null ? "" : value.toString();
                                  },
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                width: 600,
                                child: TextFieldTimePicker(
                                  fullWidth: false,
                                  suffixIcon: Icon(Icons.access_time),
                                  labelText: "To Time",
                                  initialTime: null,
                                  validatorCallBack: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  onTimeChanged: (value) {
                                    toTime = value == null ? "" : value.toString();
                                  },
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                width: 600,
                                child: TextFieldDatePicker(
                                  fullWidth: false,
                                  suffixIcon: const Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Icon(Icons.calendar_month)
                                  ),
                                  labelText: "Event Date",
                                  firstDate: DateTime(DateTime.now().year - 100),
                                  lastDate: DateTime(DateTime.now().year + 100),
                                  initialDate: null,
                                  validatorCallBack: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  onDateChanged: (value) {
                                    setState(() {
                                      dayData = value.toString();
                                    });
                                  },
                                ),
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
                          if (_formKey.currentState!.validate() == false ) {
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
