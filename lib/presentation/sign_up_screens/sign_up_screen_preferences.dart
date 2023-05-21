import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huddle/widgets/app_bar/custom_app_bar.dart';



class PreferencesScreen extends StatefulWidget {
  final String name;
  Map<String, dynamic> formData = new Map<String, dynamic>();

  PreferencesScreen({required this.name ,required this.formData});
  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState(name: name,formData:formData);
}

class _PreferencesScreenState extends State<PreferencesScreen> {
    final String name;
    Map<String, dynamic> formData = new Map<String, dynamic>();
  _PreferencesScreenState({required this.name, required this.formData});

  @override
  void initState() {
    print(formData["email"]);
    print(name.split(" ")[0]);
    super.initState();
  }
    bool isClicked = false;
    void submitForm ()async{
      final dio = Dio();
      final response = await dio.post("https://localhost:7167/api/Users/RegisterConsumer/",data: formData);
      print(response);
    }
  final pickedPref = <String>[""];
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
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        child: Container(
                          height: 141,
                          width: 114,
                          decoration: BoxDecoration(
                            color: isClicked
                                ? Color.fromRGBO(133, 181, 179, 0.13)
                                : Color.fromRGBO(1, 123, 119, 1),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: isClicked
                                ? [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ]
                                : [],
                            border: isClicked
                                ? Border.all(
                              color: Colors.lightBlue,
                              width: 2,
                            )
                                : Border.all(
                              color: Color.fromRGBO(1, 123, 119, 1),
                              width: 2,
                            ),
                          ),
                          child: Card(
                            elevation: 0,
                            color: Color.fromRGBO(1, 123, 119, 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.fastfood,
                                    size: 75,
                                    color: Color.fromRGBO(203, 203, 203, 1),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text(
                                      'Food',
                                      style: GoogleFonts.poppins(fontSize: 20),
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
                          print("Art & Museum");
                          pickedPref.add("Art & Museum");
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
                          pickedPref.add("Sports");
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

                          pickedPref.add("Entertainment");
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
                                          'Entertainment',
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
                          pickedPref.add("Festivals");
                          submitForm();
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
                          pickedPref.add("Games");

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
