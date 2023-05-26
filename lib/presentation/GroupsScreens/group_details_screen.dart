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
                  child: createCard(name: "PSUT Bar",isIn: true,priceRating: 2 , rating : 3.7),
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

  Widget createCard ({
    required String name,
    required bool isIn,
    required num priceRating ,
    required num rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFfafbfc),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14091e42),
              offset: Offset(-3, 10),
              blurRadius: 3,
              spreadRadius: -1),
          BoxShadow(
              color: Color(0x19091e42),
              offset: Offset(-4, 7),
              blurRadius: 3,
              spreadRadius: 0),
        ],
      ),
      height: screenHeight * 0.15,
      width: screenWidth * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Row(
                          children: [
                            Icon(Icons.star , color: rating >=1 ? Colors.yellow : Colors.grey,),
                            Icon(Icons.star , color: rating >=2 ? Colors.yellow : Colors.grey,),
                            Icon(Icons.star , color: rating >=3 ? Colors.yellow : Colors.grey,),
                            Icon(Icons.star , color: rating >=4 ? Colors.yellow : Colors.grey,),
                            Icon(Icons.star , color: rating >=5 ? Colors.yellow : Colors.grey,),
                          ]
                      )
                    ],
                  ),
                  Image.network(
                    'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.attach_money,color: priceRating >=1 ?Colors.green : Colors.grey,size: 25),
                    Icon(Icons.attach_money,color: priceRating >=2 ?Colors.green : Colors.grey,size: 25),
                    Icon(Icons.attach_money,color: priceRating >=3 ?Colors.green : Colors.grey,size: 25),
                  ],
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: Text(
                        "IN ( 5 )     OUT  ( 6 )",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: isIn ? Colors.green : Colors.red
                        )
                    )
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
