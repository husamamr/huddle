import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/color_constant.dart';
import '../../data/homeScreen/home_screen_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen();
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late double screenHeight;
  late double screenWidth;
  List<HomeScreenModel> listOfPlaces = [];
  String searchQuery = "";
  TextEditingController _textEditingController = TextEditingController();
  bool _showClearButton = false;

  Future<void> doSearch() async {
    String placeToFind = searchQuery; // use this variable either in the url or params
    String url = "https://localhost:7167/api/Groups/FindPlace/?placeToFind=$placeToFind"; //change the url ?placeToFind=$placeToFind
    final dio = Dio();
    final response = await dio.post(url, options: Options(
        headers: {HttpHeaders.contentTypeHeader: "application/json"}));
    final responseData = response.data;
    List<dynamic> decodedData = jsonDecode(responseData);
    List<HomeScreenModel> Places = [];
    decodedData.forEach((item) {
      HomeScreenModel place = HomeScreenModel.fromJson(item);
      Places.add(place);
    });

    setState(() {
      listOfPlaces = Places;
    });
  }

  @override
  void initState() {
    _textEditingController.addListener(_onTextChanged);

    super.initState();
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = _textEditingController.text.isNotEmpty;
    });
  }

  void _clearText() {
    setState(() {
      _textEditingController.clear();
      _showClearButton = false;
      listOfPlaces = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, bottom: 10),
            child: Text(
              "Explore your next adventure!",
              style: GoogleFonts.poppins(
                color: ColorConstant.blueGray400,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFf3f3f3),
                      labelStyle: GoogleFonts.poppins(color: Colors.grey),
                      hintText: "Search",
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: _showClearButton
                          ? GestureDetector(
                        onTap: _clearText,
                        child: Icon(Icons.clear, color: Colors.grey),
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Add spacing between the TextField and button
                TextButton(
                  onPressed: doSearch,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green),
                    // Set the background color to light blue
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Set the text color to grey
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color:Colors.white
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listOfPlaces.length,
              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth * 0.7,
                  margin: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: createCard(name: listOfPlaces[index].name ?? "name",
                      isOpen: listOfPlaces[index].openingHours ?? false,
                      priceRating: listOfPlaces[index].priceLevel ?? 0,
                      rating: listOfPlaces[index].rating ?? 0,
                      icon: listOfPlaces[index].icon ?? "p,"
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget createCard ({
    required String name,
    required bool isOpen,
    required double priceRating ,
    required double rating,
    required String icon,
  }) {
    print(icon);
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
                        Icon(
                          Icons.star,
                          color: rating >= 1 ? Colors.yellow : Colors.grey,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: rating >= 2 ? Colors.yellow : Colors.grey,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: rating >= 3 ? Colors.yellow : Colors.grey,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: rating >= 4 ? Colors.yellow : Colors.grey,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: rating >= 4.7 ? Colors.yellow : Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: priceRating >= 1 ? Colors.green : Colors.grey,
                          size: 20,
                        ),
                        Icon(
                          Icons.attach_money,
                          color: priceRating >= 2 ? Colors.green : Colors.grey,
                          size: 20,
                        ),
                        Icon(
                          Icons.attach_money,
                          color: priceRating >= 3 ? Colors.green : Colors.grey,
                          size: 20,
                        ),
                        SizedBox(width: 40),
                        Text(
                          isOpen ? 'Open' : 'Closed',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isOpen ? Colors.green : Colors.red,
                          ),
                        ),
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
