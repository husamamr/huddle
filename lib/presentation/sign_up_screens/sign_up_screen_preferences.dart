import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huddle/widgets/app_bar/custom_app_bar.dart';



class PreferencesScreen extends StatefulWidget {
  Map<String, dynamic> formData = new Map<String, dynamic>();

  PreferencesScreen({required this.formData});
  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState(formData:formData);
}

class _PreferencesScreenState extends State<PreferencesScreen> {
    Map<String, dynamic> formData = new Map<String, dynamic>();
  _PreferencesScreenState({required this.formData});


  @override
  void initState() {
    print(formData["email"]);
    super.initState();
  }
    bool isClickedFood = false;
    bool isClickedArt = false;
    bool isClickedSports = false;
    bool isClickedEntertainment = false;
    bool isClickedFestivals = false;
    bool isClickedGames = false;
    List<String> pickedPref = [];

    void submitForm ()async{
      pickedPref = [];
      if(isClickedFood) pickedPref.add("food");
      if(isClickedArt)  pickedPref.add("Art and museums");
      if(isClickedSports)  pickedPref.add("sports");
      if(isClickedEntertainment)  pickedPref.add("entertainment");
      if(isClickedFestivals)  pickedPref.add("festivals");
      if(isClickedGames)  pickedPref.add("Games");

      print(pickedPref);
      final dio = Dio();
      final response = await dio.post("https://localhost:7167/api/Users/RegisterConsumer/",data: formData);
      print(response);
    }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white38,
                leadingWidth: 40,
                centerTitle: true,
                title: Text("Preference",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroySemiBold24)
            ),
            body: Stack(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(65, 15, 5, 30),
                  child: Text(
                    "Please Choose Your Preferred Categories:",
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
                        onTap: () {
                          setState(() {
                            isClickedFood = !isClickedFood;
                          });
                        },
                        child: Container(
                          height: 141,
                          width: 114,
                          decoration: BoxDecoration(
                            color: isClickedFood
                                ? Color.fromRGBO(133, 181, 179, 0.13)
                                : Color.fromRGBO(1, 123, 119, 1),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: isClickedFood
                                ? [
                              const BoxShadow(
                                color: Colors.white,
                                blurRadius: 1,
                                offset: Offset(-2, 2),
                              ),
                            ]
                                : [],
                            border: Border.all(
                              color: const Color.fromRGBO(1, 123, 119, 1),
                              width: 1,
                            ),
                          ),
                          child: Card(
                            elevation: 0,
                            color: isClickedFood ? Color.fromRGBO(1, 123, 119, 0.86) : Color.fromRGBO(1, 123, 119, 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              children: <Widget>[
                                const Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.fastfood,
                                    size: 75,
                                    color: Colors.white,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text(
                                      'Food',
                                      style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isClickedArt = !isClickedArt;
                          });
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: isClickedArt
                                  ? Color.fromRGBO(133, 181, 179, 0.13)
                                  : Color.fromRGBO(1, 123, 119, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              boxShadow: isClickedArt
                                  ? [
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                  offset: Offset(-2, 2),
                                ),
                              ]
                                  : [],
                              border: Border.all(
                                color: const Color.fromRGBO(1, 123, 119, 1),
                                width: 1,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: isClickedArt ? Color.fromRGBO(1, 123, 119, 0.86) : Color.fromRGBO(1, 123, 119, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    const Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.brush,
                                          size: 75,
                                          color: Colors.white,
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Art & Museums',
                                          style: GoogleFonts.poppins(
                                              fontSize: 17,
                                            color:  Colors.white,
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
                          setState(() {
                            isClickedSports = !isClickedSports;
                          });
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: isClickedSports
                                  ? Color.fromRGBO(133, 181, 179, 0.13)
                                  : Color.fromRGBO(1, 123, 119, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              boxShadow: isClickedSports
                                  ? [
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                  offset: Offset(-2, 2),
                                ),
                              ]
                                  : [],
                              border: Border.all(
                                color: const Color.fromRGBO(1, 123, 119, 1),
                                width: 1,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: isClickedSports ? Color.fromRGBO(1, 123, 119, 0.86) : Color.fromRGBO(1, 123, 119, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    const Padding(
                                        padding:  EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.sports_soccer,
                                          size: 75,
                                          color: Colors.white,
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Sports',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                            color: Colors.white
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
                          setState(() {
                            isClickedEntertainment = !isClickedEntertainment;
                          });
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: isClickedEntertainment
                                  ? Color.fromRGBO(133, 181, 179, 0.13)
                                  : Color.fromRGBO(1, 123, 119, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              boxShadow: isClickedEntertainment
                                  ? [
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                  offset: Offset(-2, 2),
                                ),
                              ]
                                  : [],
                              border: Border.all(
                                color: const Color.fromRGBO(1, 123, 119, 1),
                                width: 1,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: isClickedEntertainment ? Color.fromRGBO(1, 123, 119, 0.86) : Color.fromRGBO(1, 123, 119, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.movie,
                                          size: 75,
                                          color: Colors.white,
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Entertainment',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                            color: Colors.white
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
                          setState(() {
                            isClickedFestivals = !isClickedFestivals;
                          });
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: isClickedFestivals
                                  ? Color.fromRGBO(133, 181, 179, 0.13)
                                  : Color.fromRGBO(1, 123, 119, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              boxShadow: isClickedFestivals
                                  ? [
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                  offset: Offset(-2, 2),
                                ),
                              ]
                                  : [],
                              border: Border.all(
                                color: const Color.fromRGBO(1, 123, 119, 1),
                                width: 1,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: isClickedFestivals ? Color.fromRGBO(1, 123, 119, 0.86) : Color.fromRGBO(1, 123, 119, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    const Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.festival_rounded,
                                          size: 75,
                                          color: Colors.white,
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Festivals',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              color: Colors.white
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
                          setState(() {
                            isClickedGames = !isClickedGames;
                          });
                        },
                        child: Container(
                            height: 141,
                            width: 114,
                            decoration: BoxDecoration(
                              color: isClickedGames
                                  ? Color.fromRGBO(133, 181, 179, 0.13)
                                  : Color.fromRGBO(1, 123, 119, 1),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              boxShadow: isClickedGames
                                  ? [
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                  offset: Offset(-2, 2),
                                ),
                              ]
                                  : [],
                              border: Border.all(
                                color: const Color.fromRGBO(1, 123, 119, 1),
                                width: 1,
                              ),
                            ),

                            child: Card(
                                elevation: 0,
                                color: isClickedGames ? Color.fromRGBO(1, 123, 119, 0.86) : Color.fromRGBO(1, 123, 119, 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.sports_esports,
                                          size: 75,
                                          color: Colors.white,
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'Games',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                            color: Colors.white
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

                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: screenWidth * 0.7,
                      child: ElevatedButton(
                        onPressed: submitForm,
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Color.fromRGBO(1, 123, 119, 1),),
                          ),
                        ),
                      ),
                    ),
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
