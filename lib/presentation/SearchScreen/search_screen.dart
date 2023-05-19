import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/color_constant.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, bottom: 10),
          child:  Text(
            "Search Page :",
            style: GoogleFonts.poppins(
              color: ColorConstant.blueGray400,
              fontWeight: FontWeight.bold,
              fontSize: 30 ,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value.toLowerCase();
              });
            },
            decoration: InputDecoration(
              labelStyle: GoogleFonts.poppins(
                  color: Colors.grey
              ),
              hintText: "Search",
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstant.blueGray400
                )
              ),
              focusColor: ColorConstant.blueGray400,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstant.blueGray400
                )
              ),
              enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstant.blueGray400
                )
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstant.blueGray400
                )
              ),
              prefixIcon: const Icon(Icons.search,color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
