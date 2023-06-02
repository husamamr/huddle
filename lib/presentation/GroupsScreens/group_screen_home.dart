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
     String uid = "b754ca40-77fa-ed11-9621-9828a648856e";
     Map <String,dynamic> test = new Map<String, dynamic>();
     test['userId'] = uid;
     final dio = Dio();
     dio.options.headers['userId'] = uid;
     String url = "https://localhost:7167/api/Groups/GetConsumerGroups/";
     final response = await dio.post(url,options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
     queryParameters: test);
    List<dynamic> responseData = response.data as List<dynamic>;
     List<GroupModel> groupDetailsList = [];
    responseData.forEach((item) {
      GroupModel groupDetails = GroupModel.fromJson(item);
      groupDetailsList.add(groupDetails);
    });
    setState(() {
    listOfGroups = groupDetailsList;
    });
    return 'Data loaded successfully';
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: fetchGroups(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
         if (snapshot.hasData) {
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
                      fontSize: 35,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: listOfGroups.length,
                    itemBuilder: (context, index) {
                      GroupModel group = listOfGroups[index];

                      return _buildGroupListItems(
                        groupName: group.name,
                        isAct: index.isEven
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
        },
    );

  }
  Widget _buildGroupListItems({ String? groupName, required bool isAct}) {
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
            color: const Color(0xfff4f5f7),
            borderRadius: BorderRadius.circular(7),
          ),
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Row(
                  children: [
                    isAct ? const CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 5,
                    ) : Container(),
                    isAct ? const SizedBox(
                      width: 5,
                    ) : Container(),
                    Text(groupName!, style: GoogleFonts.poppins(
                      color: Color(0xff060606),
                      fontSize: 16,
                    ),),
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff414343),
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
