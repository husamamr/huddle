import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/color_constant.dart';
import '../../data/groups/models/group_model.dart';
import 'group_details_screen.dart';

class GroupScreen extends StatefulWidget {
  String userID;
  GroupScreen({required this.userID});
  @override
  State<GroupScreen> createState() => _GroupScreenState(userID: userID);
}

class _GroupScreenState extends State<GroupScreen> {
  String userID;
  _GroupScreenState({required this.userID});
  late double screenHeight;
  late double screenWidth;
  List<GroupModel> listOfGroups = [];
  final ScrollController _scrollController = new ScrollController();
  Future<String> fetchGroups() async {
    // Simulating an asynchronous operation
    // String uid = "b754ca40-77fa-ed11-9621-9828a648856e";
    // Map <String,dynamic> test = new Map<String, dynamic>();
    // test['userId'] = uid;
    // final dio = Dio();
    // String url = "https://localhost:7167/api/Groups/GetConsumerGroups/";
    // final response = await dio.post(url,options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
    //     data: jsonEncode(uid));
    // print(response.data);
    return Future.delayed(Duration(seconds: 0), () => 'Data loaded successfully');
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: fetchGroups(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // return Text('Data: ${snapshot.data}');
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
                      fontSize: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: 3,
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
        },
    );

  }
  Widget _buildGroupListItems({required String groupName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: GestureDetector(
        onTap: () {
          //Todo:  push for groups details page and send the id of group
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupDetails(groupID: "sijfgnsijfnwri", groupName: groupName , joinID: "# 25256", ),
            ),);
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFfafbfc),
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
               BoxShadow(
                  color: Color(0x14091e42),
                  offset: Offset(-2, 3),
                  blurRadius: 3,
                  spreadRadius: -1),
               BoxShadow(
                  color: Color(0x19091e42),
                  offset: Offset(-3, 5),
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
