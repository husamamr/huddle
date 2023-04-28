import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';

class RegisterPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      ColorConstant.gray900,
                      ColorConstant.gray90001
                    ])),
                child: Container(
                    width: double.maxFinite,
                    padding: getPadding(left: 30, top: 60, right: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(left: 15),
                              child: Text("Huddle",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtIndieFlowerRegular34)),
                          Spacer(),
                          Align(
                              alignment: Alignment.center,
                              child: Text("You’re a?",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtImprimaRegular34)),
                          Padding(
                              padding: getPadding(top: 26, bottom: 259),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: getPadding(
                                            left: 10,
                                            top: 45,
                                            right: 10,
                                            bottom: 45),
                                        decoration: AppDecoration.fillGray500
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder37),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    navigateToStandardForm(
                                                        context);
                                                  },
                                                  child: Text("Standard",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtImprimaRegular24))
                                            ])),
                                    Container(
                                        padding: getPadding(
                                            left: 13,
                                            top: 31,
                                            right: 13,
                                            bottom: 31),
                                        decoration: AppDecoration.fillGray500
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder37),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    navigateToBusinessForm(
                                                        context);
                                                  },
                                                  child: Container(
                                                      width:
                                                          getHorizontalSize(89),
                                                      child: Text(
                                                          "Business Owner",
                                                          maxLines: null,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: AppStyle
                                                              .txtImprimaRegular24)))
                                            ]))
                                  ]))
                        ])))));
  }

  navigateToStandardForm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.standardFormScreen);
  }

  navigateToBusinessForm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.businessFormScreen);
  }
}
