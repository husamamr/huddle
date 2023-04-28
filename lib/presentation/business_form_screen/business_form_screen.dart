import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';
import 'package:huddle/widgets/custom_button.dart';
import 'package:huddle/widgets/custom_text_form_field.dart';

class BusinessFormScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  TextEditingController nameoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordoneController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(
                0.5,
                0,
              ),
              end: Alignment(
                0.5,
                1,
              ),
              colors: [
                ColorConstant.gray900,
                ColorConstant.gray90001,
              ],
            ),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: getPadding(
                left: 36,
                top: 60,
                right: 36,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 9,
                    ),
                    child: Text(
                      "Huddle",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtIndieFlowerRegular34,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: getMargin(
                        top: 47,
                      ),
                      decoration: AppDecoration.fillGray1001e.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 17,
                            ),
                            child: Text(
                              "Business Owner",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular16.copyWith(
                                letterSpacing: getHorizontalSize(
                                  0.15,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 18,
                            ),
                            child: SizedBox(
                              width: getHorizontalSize(
                                144,
                              ),
                              child: Divider(
                                height: getVerticalSize(
                                  1,
                                ),
                                thickness: getVerticalSize(
                                  1,
                                ),
                                color: ColorConstant.black90001,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: nameController,
                    hintText: "Owner Name",
                    margin: getMargin(
                      top: 24,
                    ),
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: nameoneController,
                    hintText: "Place Name",
                    margin: getMargin(
                      top: 10,
                    ),
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: emailController,
                    hintText: "Email",
                    margin: getMargin(
                      top: 10,
                    ),
                    textInputType: TextInputType.emailAddress,
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: passwordController,
                    hintText: "Password",
                    margin: getMargin(
                      top: 10,
                    ),
                    textInputType: TextInputType.visiblePassword,
                    isObscureText: true,
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: passwordoneController,
                    hintText: "Repeat Password",
                    margin: getMargin(
                      top: 10,
                    ),
                    textInputType: TextInputType.visiblePassword,
                    isObscureText: true,
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: phonenumberController,
                    hintText: "Phone Number",
                    margin: getMargin(
                      top: 10,
                    ),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.phone,
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      43,
                    ),
                    width: getHorizontalSize(
                      132,
                    ),
                    text: "Next",
                    margin: getMargin(
                      top: 57,
                      bottom: 5,
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
