import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huddle/widgets/app_bar/custom_app_bar.dart';



class PreferencesScreen extends StatefulWidget {
  
  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(144,192,206, 1),
                leadingWidth: 40,
                centerTitle: true,
                title: Text("Preference",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroySemiBold24)
            ),
            body: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(65, 15, 5, 30),
                  child: const Text(
                    "Please Choose Your Preferred Categories:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          print("Food");
                        },
                        child: Container(
                          height: 141,
                          width: 114,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(154, 194, 149, 1),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            //border: Colors.black,
                            border: Border.all(
                              color: Color.fromRGBO(154, 194, 149, 1),
                              width: 2,
                            ),
                          ),

                          child: Card(
                              elevation: 0,
                              color: Color.fromRGBO(154, 194, 149, 1),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              child: Column(
                                  children: <Widget>[
                                    Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.fastfood,
                                      size: 75,
                                      color: Color.fromRGBO(203, 203, 203, 1),
                                      )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Food',
                                          style: GoogleFonts.poppins(
                                            fontSize: 20
                                          ),
                                          //textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                              )
                          )


                          /*padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text("Food"),*/
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          print("Art & Museum");
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(154, 194, 149, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              //border: Colors.black,
                              border: Border.all(
                                color: Color.fromRGBO(154, 194, 149, 1),
                                width: 2,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: Color.fromRGBO(154, 194, 149, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.brush,
                                          size: 75,
                                          color: Color.fromRGBO(203, 203, 203, 1),
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Art & Museums',
                                          style: GoogleFonts.poppins(
                                              fontSize: 17
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            )
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          print("Sports");
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(154, 194, 149, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              //border: Colors.black,
                              border: Border.all(
                                color: Color.fromRGBO(154, 194, 149, 1),
                                width: 2,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: Color.fromRGBO(154, 194, 149, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.sports_soccer,
                                          size: 75,
                                          color: Color.fromRGBO(203, 203, 203, 1),
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Sports',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            )
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          print("Movies");
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(154, 194, 149, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              //border: Colors.black,
                              border: Border.all(
                                color: Color.fromRGBO(154, 194, 149, 1),
                                width: 2,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: Color.fromRGBO(154, 194, 149, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.movie,
                                          size: 75,
                                          color: Color.fromRGBO(203, 203, 203, 1),
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Movies',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            )
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          print("Festivals");
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(154, 194, 149, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              //border: Colors.black,
                              border: Border.all(
                                color: Color.fromRGBO(154, 194, 149, 1),
                                width: 2,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: Color.fromRGBO(154, 194, 149, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.festival_rounded,
                                          size: 75,
                                          color: Color.fromRGBO(203, 203, 203, 1),
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Festivals',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            )
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          print("Games");
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(154, 194, 149, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              //border: Colors.black,
                              border: Border.all(
                                color: Color.fromRGBO(154, 194, 149, 1),
                                width: 2,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: Color.fromRGBO(154, 194, 149, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.sports_esports,
                                          size: 75,
                                          color: Color.fromRGBO(203, 203, 203, 1),
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Games',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            )
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
        )

    );
  }
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
