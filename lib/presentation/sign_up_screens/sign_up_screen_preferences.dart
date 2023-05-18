import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';
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
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text("Food"),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("Art & Museums");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[200],
                          child: const Text('Art & Museums'),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("Sports");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[300],
                          child: const Text('Sports'),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("Movies");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[400],
                          child: const Text('Movies'),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("Festivals");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[500],
                          child: const Text('Festivals'),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("Games");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[600],
                          child: const Text('Games'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
        )

        /*CustomScrollView(

        )*/

    );
  }
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
