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
            appBar: CustomAppBar(
                height: getVerticalSize(42),
                leadingWidth: 40,
                leading: CustomImageView(
                    svgPath: ImageConstant.imgArrowleft,
                    height: getSize(24),
                    width: getSize(24),
                    margin: getMargin(left: 16, bottom: 4),
                    onTap: () {
                      onTapImgArrowleft(context);
                    }),
                centerTitle: true,
                title: Text("Sign Up",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroySemiBold24)),
            body: Container(
            color: Colors.red,
            )
        )
    );
  }
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
