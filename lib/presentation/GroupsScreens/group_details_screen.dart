import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final List<String> userLabels = ["S J", "A N", "N T", "H A" , "B A", "A T", "O A", "O A", "Z A", "S K", "D D"];
  final List<String> userNames = ["shady", "anton", "nour", "husam" , "baha", "aseel", "Othman", "Osama", "Zena", "Sosoo", "Daragmeh"];
  final List<Color> colors = const [
    Color(0xffFFC300), Color(0xffFF5733), Color(0xffC70039), Color(0xff900C3F),
    Color(0xff581845), Color(0xff3A1651), Color(0xff005D6E), Color(0xff008F39),
    Color(0xff9DCC00), Color(0xffFF9B00), Color(0xffFF3800), Color(0xffFF003C),
    Color(0xffC10066), Color(0xff7700A1), Color(0xff0045D2) ,Color(0xff00A8FF)
  ];


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("$groupName ( $joinID )"),
      ),
      body: Column(
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
                itemCount: userLabels.length,
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
                color: Colors.grey,
                thickness: 1.5,
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.7,
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



  Widget buildUserCircle(int index) {
    String label = userLabels[index];
    String name = userNames[index];
    Color color = colors[index % colors.length];

    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
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
}
