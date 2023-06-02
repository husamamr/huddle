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

  late List<bool> inList;
  late List<bool> outList;

  bool userConfirm = false;

  final List<String> userLabels = ["S J", "A N", "N T", "H A" , "B A", "A T", "O A", "O A", "Z A", "S K", "D D"];
  final List<String> userNames = ["shady", "anton", "nour", "husam" , "baha", "aseel", "Othman", "Osama", "Zena", "Sosoo", "Daragmeh"];
  final List<Color> colors = const [
    Color(0xffFFC300), Color(0xffFF5733), Color(0xffC70039), Color(0xff900C3F),
    Color(0xff581845), Color(0xff3A1651), Color(0xff005D6E), Color(0xff008F39),
    Color(0xff9DCC00), Color(0xffFF9B00), Color(0xffFF3800), Color(0xffFF003C),
    Color(0xffC10066), Color(0xff7700A1), Color(0xff0045D2) ,Color(0xff00A8FF)
  ];


  @override
  void initState() {
    super.initState();
    inList = List<bool>.filled(6, false);
    outList = List<bool>.filled(6, false);
  }


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth * 0.7,
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                  child: createCard(index: index , name: "Macdonalds",priceRating: 2 , rating : 3.7, groupID: "gu6ughj798uihj"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  bool yes = false;



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
              ),
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
    required String name,
    bool isOpen = true,
    double priceRating = 2,
    double rating = 3,
    required String groupID,
    required int index,
    String icon = 'https://lh3.googleusercontent.com/places/ANJU3DuD8YoAv3quh7EH8cNzhR-yM_khSNtzO49OTB9mTCWQXT9vfp50qukK1i1h2NidYtuTHCpOf5IzDfSj9ZqUkDxWQkLdj3qd318=s1600-w400',
  }) {
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
                        userConfirm ? Container(): Radio(
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
                        Text('( 5 )', style: GoogleFonts.poppins(),),
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
                        Text('( 5 )', style: GoogleFonts.poppins()),
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
                    icon,
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
