import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/color_constant.dart';

class GroupScreen extends StatefulWidget {
  GroupScreen();

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  late double screenHeight;
  late double screenWidth;

  final ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 20),
          child:  Text(
              "My Groups :",
              style: GoogleFonts.poppins(
              color: ColorConstant.blueGray400,
              fontWeight: FontWeight.bold,
              fontSize: 45 ,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildGroupListItems(
                groupName: "Group 1",
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildGroupListItems({required String groupName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFfafbfc),
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
               BoxShadow(
                  color: Color(0x14091e42),
                  offset: Offset(-3, 6),
                  blurRadius: 3,
                  spreadRadius: -1),
               BoxShadow(
                  color: Color(0x19091e42),
                  offset: Offset(-4, 7),
                  blurRadius: 3,
                  spreadRadius: 0)
            ],
          ),
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(groupName, style: GoogleFonts.poppins(),),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF919191),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
