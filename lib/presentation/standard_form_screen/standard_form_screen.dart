import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';
import 'package:huddle/widgets/custom_button.dart';
import 'package:huddle/widgets/custom_text_form_field.dart';

class StandardFormScreen extends StatelessWidget {
  TextEditingController usertypeController = TextEditingController();

  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

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
                  CustomTextFormField(
                    width: getHorizontalSize(
                      144,
                    ),
                    focusNode: FocusNode(),
                    controller: usertypeController,
                    hintText: "Standard User",
                    margin: getMargin(
                      top: 47,
                    ),
                    variant: TextFormFieldVariant.FillGray1001e,
                    shape: TextFormFieldShape.CustomBorderTL20,
                    fontStyle: TextFormFieldFontStyle.RobotoRegular16,
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: firstnameController,
                    hintText: "First Name",
                    margin: getMargin(
                      top: 24,
                    ),
                  ),
                  CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: lastnameController,
                    hintText: "Last Name",
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
                    text: "Register",
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
