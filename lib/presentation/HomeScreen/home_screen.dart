import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/color_constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenHeight;
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.only(top: 40, left: 20),
          child:  Text(
            "Near to me :",
            style: GoogleFonts.poppins(
              color: ColorConstant.blueGray400,
              fontWeight: FontWeight.bold,
              fontSize: 40 ,
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {

              return Container(
                height: screenHeight * 0.15,
                width: screenWidth * 0.7,
                margin: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                child: createCard(name: "PSUT Bar",isOpen: true,priceRating: 2 , rating : 3.7),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget createCard ({
  required String name,
  required bool isOpen,
    required num priceRating ,
    required num rating,
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
