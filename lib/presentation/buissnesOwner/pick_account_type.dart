import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huddle/presentation/sign_up_screens/sign_up_screen_personal_info.dart';
import 'package:huddle/presentation/buissnesOwner/business_owner_sign_in.dart';
import 'package:huddle/widgets/app_bar/custom_app_bar.dart';
import 'package:huddle/core/app_export.dart';
class PickAccount extends StatelessWidget {
  const PickAccount({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 251, 255, 1),
      appBar: CustomAppBar(
        height: getVerticalSize(42),
        leadingWidth: 40,
        leading: CustomImageView(
          svgPath: ImageConstant.imgArrowleft,
          height: getSize(24),
          width: getSize(24),
          margin: getMargin(left: 16, bottom: 4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Huddle",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtGilroySemiBold24,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(

              'Choose Account Type',
              style: GoogleFonts.poppins(fontSize: 24),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: screenWidth*0.5,
              child: ElevatedButton(

                onPressed: () {
                  // Perform actions for Customer button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                    'Customer'
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: screenWidth*0.5,
              child: ElevatedButton(
                onPressed: () {
                  // Perform actions for Business Owner button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BOPersonalInfo(),
                    ),
                  );
                },
                child: Text('Business Owner'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

