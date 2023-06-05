import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huddle/presentation/HomeScreen/home_screen.dart';
// import 'package:pinput/pinput.dart';
import 'package:dio/dio.dart';
import 'package:pinput/pinput.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'package:huddle/presentation/bottomBar/bottom_bar.dart';

bool selected = false;

class OtpScreen extends StatefulWidget {
  Map<String, dynamic> formData = new Map<String, dynamic>();
  OtpScreen({required this.formData});
  @override
  // ignore: no_logic_in_create_state
  State<OtpScreen> createState() => _OtpScreenState(formData: formData);
}

class _OtpScreenState extends State<OtpScreen> {
  Map<String, dynamic> formData = new Map<String, dynamic>();
  _OtpScreenState({required this.formData});

  final TextEditingController _pinPutController = TextEditingController();
  String otpStr = "";


  @override
  void initState() {
    fetchDataFromApi();
    super.initState();
  }

  void fetchDataFromApi() async {
    try {
      final dio = Dio();
      // Make an API request using Dio
      String mail = formData['email'];
      String params ="https://localhost:7167/api/Users/AuthenticateUser" ;
      final response = await dio.post(params,options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
        data: jsonEncode(mail),)  ;
      // Extract and return the response data as a string
      String mess = response.data['message'].toString();
      setState(() {
        otpStr = mess;
      });
    } catch (error) {
      // Handle any errors that occur during the API request
      print('Error: $error');
      // return 'Failed to fetch data';
    }
  }
  void validate () async{
    print(otpStr);
    Map <String,dynamic> test = new Map<String, dynamic>();
    test['password'] = "Ab1asd#";
    test['email']= "asda";
    test["phoneNumber"]= "123123";
    test['about']= "adasd";
    test['fname']= "ahmed";
    test['lname']= "shawish";
    test['dob']= "12";
    test['preferredTimeFrom'] = "12";
    test['preferredTimeTo']= "13";
    if(otpStr == _pinPutController.text){
      final dio = Dio();
     String url = "https://localhost:7167/api/Users/RegisterConsumer";
      final response = await dio.post(url,options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
      data: jsonEncode(test));
      print(response.data);
      if(response.data['isSuccess']){
        print("registered");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomBar(),
          ),
          (route) => false,
        );
      }
    }


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/img_email.svg',
                width: 75,
                height: 75,
              ),
              Padding(
                padding: getPadding(top: 13),
                child: Text(
                  "OTP Verification",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroySemiBold24,
                ),
              ),
              Padding(
                padding: getPadding(top: 32, bottom: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "OTP is sent to ",
                        style: TextStyle(
                          color: ColorConstant.fromHex("#ff74839d"),
                          fontSize: getFontSize(18),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          color: ColorConstant.fromHex("#ff0061ff"),
                          fontSize: getFontSize(18),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Pinput(
                controller: _pinPutController,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                autofocus: true,
                onCompleted: (pin) {
                  print(pin);
                  selected = false;
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
              CustomButton(
                height: getVerticalSize(50),
                text: "Verify OTP",
                margin: getMargin(top: 32),
                onTap: (){
                  //add navigator to home screen
                validate();
                },
              ),
              Padding(
                padding: getPadding(top: 26, bottom: 5),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't Receive Code?",
                        style: TextStyle(
                          color: ColorConstant.fromHex("#ff74839d"),
                          fontSize: getFontSize(16),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: " Resend",
                        style: TextStyle(
                          color: ColorConstant.fromHex("#ff0061ff"),
                          fontSize: getFontSize(16),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}