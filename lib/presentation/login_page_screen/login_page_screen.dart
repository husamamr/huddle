import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';
import 'package:huddle/widgets/custom_button.dart';
import 'package:huddle/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LoginPageScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      ColorConstant.gray900,
                      ColorConstant.gray90000
                    ])),
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(left: 21, top: 60, right: 21),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 24),
                                      child: Text("Huddle",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtIndieFlowerRegular34))),
                              Spacer(),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: emailController,
                                  hintText: "Email",
                                  margin: getMargin(left: 15, right: 15),
                                  textInputType: TextInputType.emailAddress),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: passwordController,
                                  hintText: "Password",
                                  margin:
                                      getMargin(left: 15, top: 7, right: 15),
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  isObscureText: true),
                              CustomButton(
                                  height: getVerticalSize(43),
                                  width: getHorizontalSize(132),
                                  text: "Login",
                                  margin: getMargin(top: 20)),
                              Padding(
                                  padding: getPadding(top: 19),
                                  child: Divider(
                                      height: getVerticalSize(1),
                                      thickness: getVerticalSize(1),
                                      color: ColorConstant.whiteA700)),
                              Padding(
                                  padding: getPadding(top: 12),
                                  child: Text("New here?",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtKarlaRegular20)),
                              CustomButton(
                                  height: getVerticalSize(43),
                                  width: getHorizontalSize(132),
                                  text: "Register",
                                  margin: getMargin(top: 6, bottom: 204),
                                  onTap: () {
                                    navigateToRegister(context);
                                  })
                            ]))))));
  }

  navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerPageScreen);
  }
}
