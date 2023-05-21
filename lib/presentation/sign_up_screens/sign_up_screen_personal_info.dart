import 'package:flutter/material.dart';
import 'package:huddle/core/app_export.dart';
import 'package:huddle/data/sign_up_repo/sign_up_repo.dart';
import 'package:huddle/presentation/sign_up_screens/sign_up_screen_preferences.dart';
import 'package:huddle/widgets/app_bar/custom_app_bar.dart';
import 'package:huddle/widgets/custom_button.dart';
import 'package:huddle/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData = new Map<String, dynamic>();

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
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                    getPadding(left: 16, top: 36, right: 16, bottom: 36),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Create Your Account",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroyBold24),
                          Padding(
                              padding: getPadding(top: 31),
                              child: Text("First Name",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                            //  focusNode: FocusNode(),
                              controller: _firstNameController,
                              onChange: (value) {
                                setState(() {
                                  formData['fname'] = _firstNameController.text;
                                });
                              },
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "this field is required ";
                                }
                              },
                              hintText: "Enter First Name",
                              margin: getMargin(top: 8)),

                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("Last Name",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                             // focusNode: FocusNode(),
                              controller: _lastNameController,
                              onChange: (value) {
                                setState(() {
                                  formData['lname'] = _lastNameController.text;
                                });
                              },
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "this field is required ";
                                }
                              },
                              hintText: "Enter Last Name",
                              margin: getMargin(top: 7)),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Email Id",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                             // focusNode: FocusNode(),
                              controller: _emailController,
                              onChange: (value) {
                                setState(() {
                                  formData['email'] = _emailController.text;
                                });
                              },
                              validator: (value){
                                if(value == null || value.isEmpty){
                                 return "this field is required ";
                                }
                              },
                              hintText: "Enter Your Email",
                              margin: getMargin(top: 8),
                              textInputType: TextInputType.emailAddress),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Mobile Number",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                              maxLen: 10,
                            //  focusNode: FocusNode(),
                              controller: _mobileNumberController,
                              onChange: (value) {
                                setState(() {
                                  formData['phoneNumber'] = _mobileNumberController.text;
                                });
                              },
                              keyboardType:TextInputType.number ,
                              validator: (value){
                                if(value == null || value.isEmpty || value.length<10){
                                  return "phone number must be 10 digits ";
                                }
                              },
                              hintText: "Enter Mobile Number",
                              margin: getMargin(top: 8),
                              textInputType: TextInputType.phone),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("Password",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                             // focusNode: FocusNode(),
                              controller: _passwordController,
                              onChange: (value) {
                                setState(() {
                                  formData['password'] = _passwordController.text;
                                });
                              },
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "this field is required ";
                                }
                              },
                              hintText: "Enter Password",
                              margin: getMargin(top: 7),
                              padding: TextFormFieldPadding.PaddingT12,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: Container(
                                  margin: getMargin(all: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgEye)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44)),
                              isObscureText: true),
                          CustomButton(
                            height: getVerticalSize(50),
                            text: "Next",
                            margin: getMargin(top: 24, bottom: 5),

                            onTap: () {
                              if (_formKey.currentState!.validate()== true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PreferencesScreen(formData: formData,),
                                  ),
                                );
                              }


                            },
                          )
                        ]
                    )
                )
            )
        )
    );
  }

  Future<void> validateForm() async {
    // Iterate through the text fields in the form and call the validate method on each text field.
    List<String> errors = [];
    for (TextEditingController controller in [
      _firstNameController,
      _lastNameController,
      _emailController,
      _mobileNumberController,
      _passwordController,
    ]) {
      String error = validateText(controller.text);
      if (error != "success") {
        errors.add(error);
      }
    }

    // If any of the text fields are invalid, return an error message.
    if (errors.isNotEmpty) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(errors.join("\n")),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }

    // Otherwise, return null.
    return null;
  }
  String validateText(String text) {
    if (text.isEmpty) {
      return "Please enter some text";
    }
    return "success";
  }
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}




