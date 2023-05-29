import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huddle/data/homeScreen/home_screen_model.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/utils/color_constant.dart';
import '../../data/homeScreen/home_screen_model.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenHeight;
  late double screenWidth;
  bool dataFetched = false;
  List<HomeScreenModel> listOfPlaces = [];
  String userId = "b754ca40-77fa-ed11-9621-9828a648856e";
  late double latitude ;
  late double longitude ;
  Map <String,dynamic> params = new Map<String,dynamic>();

  Future<String> GetPLaces() async{
    params['userId'] = userId;
    if (await checkPermission() ){
    Position position = await Geolocator.getCurrentPosition();
     latitude =  position.latitude;
     longitude =  position.longitude;
    };
    params['latitude'] = latitude;
    params['longitude'] = longitude;
    final dio = Dio();
    String url = "https://localhost:7167/api/Home/GetNearBy/";
    final response = await dio.post(url,
        options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
    data: params);
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
    return "success";
  }

  Future<bool> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future:  dataFetched ? Future.value(listOfPlaces) : GetPLaces() ,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.hasData) {
          dataFetched = true;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, left: 20),
                child: Text(
                  "Near to me :",
                  style: GoogleFonts.poppins(
                    color: ColorConstant.blueGray400,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: listOfPlaces.length,
                  itemBuilder: (context, index) {


                    return Container(
                      height: screenHeight * 0.15,
                      width: screenWidth * 0.7,
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 10, left: 20, right: 20),
                      child: createCard(name: listOfPlaces[index].name ?? "name",
                          isOpen: listOfPlaces[index].openingHours ?? false,
                          priceRating: listOfPlaces[index].priceLevel ?? 0,
                          rating: listOfPlaces[index].rating ?? 0,
                          icon : listOfPlaces[index].icon ?? "p,"
                      ),
                    );
                  },
                ),
              ),
            ],
          );
          } else{
          return const Center(child: CircularProgressIndicator());
        }
        },
    );
  }

  Widget createCard ({
  required String name,
  required bool isOpen,
    required double priceRating ,
    required double rating,
    required String icon,
}) {
    return SizedBox(
      height: screenHeight * 0.15,
      width: screenWidth * 0.9,
      child: Card(
        shape: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black
          )
        ),
        color: Colors.white,
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
                        Icon(Icons.star , color: rating >=4.7 ? Colors.yellow : Colors.grey,),
                        ]
                        )
                      ],
                    ),
                    Image.network(
                      icon,
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
                          isOpen ? 'Open' : 'Closed',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isOpen ? Colors.green : Colors.red
                          )
                      )
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }



}
