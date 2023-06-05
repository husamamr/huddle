import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/groups/models/groups_details_model.dart';

class GroupDetails extends StatefulWidget {
  String groupID;
  String groupName;
  String joinID;
  GroupDetails({
    required this.groupID,
    required this.groupName,
    required this.joinID,
  });

  @override
  State<GroupDetails> createState() => _GroupDetailsState(groupID: groupID,groupName: groupName, joinID: joinID);
}

class _GroupDetailsState extends State<GroupDetails> {
  String groupID;
  String groupName;
  String joinID;
  _GroupDetailsState({
    required this.groupID,
    required this.groupName,
    required this.joinID,
});

  late double screenHeight;
  late double screenWidth;
  bool dataFetched = false;
  late List<bool> inList;
  late List<bool> outList;

  bool userConfirm = true;
  GroupsDetilsModel? groupsDetails;

  final List<String> userLabels = ["S J", "A N", "N T", "H A" , "B A", "A T", "O A", "O A", "Z A", "S K", "D D"];
  final List<String> userNames = ["shady", "anton", "nour", "husam" , "baha", "aseel", "Othman", "Osama", "Zena", "Sosoo", "Daragmeh"];
  final List<Color> colors = const [
    Color(0xffFFC300), Color(0xffFF5733), Color(0xffC70039), Color(0xff900C3F),
    Color(0xff581845), Color(0xff3A1651), Color(0xff005D6E), Color(0xff008F39),
    Color(0xff9DCC00), Color(0xffFF9B00), Color(0xffFF3800), Color(0xffFF003C),
    Color(0xffC10066), Color(0xff7700A1), Color(0xff0045D2) ,Color(0xff00A8FF)
  ];

  Future<String> loadGroupsDetails() async {
    try {
      String jsonString = await rootBundle.loadString('assets/jsonExampleGroupsDetails.json');
      final jsonData = jsonDecode(jsonString);
      setState(() {
        groupsDetails = GroupsDetilsModel.fromJson(jsonData);
        userConfirm = groupsDetails!.requesterIsConfirmed == 1 ? true : false;
        print(groupsDetails!.userInfos![0].fname);
        print(groupsDetails!.activePlaces![0].placeDetails!.name);
      });
      return "success";
    } catch (e) {
      print('Error loading groups details: $e');
      return e.toString();
    }
  }

  @override
  void initState() {
    // loadGroupsDetails();
    super.initState();
    inList = List<bool>.filled(6, false);
    outList = List<bool>.filled(6, false);
  }


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: userConfirm ? null :  FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are You Sure to Confirm ? '),
                content: SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                        "after you confirm you can’t change your status for any of the suggested places at the moment",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                        ),
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();},
                    child: Text(
                        'cancel',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        userConfirm = true;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                        'sure',
                      style: GoogleFonts.poppins(
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
        backgroundColor: Colors.green,
        child: const Icon(Icons.check),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("$groupName ( $joinID )"),
      ),
      body: FutureBuilder(
        future: dataFetched ? null : loadGroupsDetails(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.hasData) {
            dataFetched = true;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 12),
                  child: Text(
                    "members :",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12,left: 8,right: 8, bottom: 5),
                  child: SizedBox(
                    height: screenHeight * 0.13, // Adjust the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: groupsDetails!.userInfos!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: buildUserCircle(index),
                        );
                      },
                    ),
                  ),
                ),

                Center(
                  child: SizedBox(
                    width: screenWidth * 0.85,
                    child: const Divider(
                      color: Color(0xfff1f1f1),
                      thickness: 1.5,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: groupsDetails!.activePlaces!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: screenWidth * 0.7,
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                        child: createCard(index: index , groupID: groupID),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
  bool yes = false;



  Widget buildUserCircle(int index) {
    String label = groupsDetails!.userInfos![index].label ?? "XX";
    String name = groupsDetails!.userInfos![index].fname ?? "name";
    Color color = colors[index % colors.length];
    int isConfirm = groupsDetails!.userInfos![index].isConfirmed ?? 0;

    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              isConfirm == 1 ?
              Positioned(
                top: 0.1,
                right: 0.1,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ) : Container(),
            ],
          ),
        ),

        const SizedBox(
          height: 7,
        ),
        Text(
            name,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),
        )
      ],
    );
  }

  Widget createCard ({
    required String groupID,
    required int index,
  }) {
    String name = groupsDetails!.activePlaces![index].placeDetails!.name ?? "Place";
    int inCount = groupsDetails!.activePlaces![index].inCount ?? 0;
    int outCount = groupsDetails!.activePlaces![index].inCount ?? 0;
    String placeImage = groupsDetails!.activePlaces![index].placeDetails!.icon!;


    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        userConfirm ? Container() : Radio(
                          value: inOut.userIn,
                          groupValue: inList[index] ? inOut.userIn : inOut.userOut,
                          onChanged: (value) {
                            setState(() {
                              inList[index] = true;
                              outList[index] = false;
                            });
                          },
                          activeColor: inList[index] ? Colors.green : Colors.grey,
                        ),
                        Text('In', style: GoogleFonts.poppins(),),
                        Text('( ${inCount.toString()} )', style: GoogleFonts.poppins(),),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        userConfirm ? Container(): Radio(
                          value: inOut.userOut,
                          groupValue: outList[index] ? inOut.userOut : inOut.userIn,
                          onChanged: (value) {
                            setState(() {
                              inList[index] = false;
                              outList[index] = true;
                            });
                          },
                          activeColor: outList[index] ? Colors.green : Colors.grey,
                        ),
                        Text('Out', style: GoogleFonts.poppins()),
                        Text('( ${outCount.toString()} )', style: GoogleFonts.poppins()),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    placeImage,
                    fit: BoxFit.cover,
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


enum inOut { userIn, userOut }
