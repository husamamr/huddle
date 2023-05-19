import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';


bool selected = false;

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController _pinPutController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SvgPicture.asset('assets/images/img_email.svg', width: 75, height: 75,),

              Padding(
                padding: getPadding(
                  top: 13,
                ),
                child: Text(
                  "OTP Verification",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroySemiBold24,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 32,
                  bottom: 10,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "OTP is sent to ",
                        style: TextStyle(
                          color: ColorConstant.fromHex("#ff74839d"),
                          fontSize: getFontSize(
                            18,
                          ),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextSpan(
                        text: "",
                        style: TextStyle(
                          color: ColorConstant.fromHex("#ff0061ff"),
                          fontSize: getFontSize(
                            18,
                          ),
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
                  )
                ),

                focusedPinTheme: PinTheme(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                autofocus: true,
                onCompleted: (pin) {
                  print(pin);
                  selected=false;
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),

              CustomButton(
                height: getVerticalSize(
                  50,
                ),
                text: "Verify OTP",
                margin: getMargin(
                  top: 32,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 26,
                  bottom: 5,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't Receive Code?",
                        style: TextStyle(
                          color: ColorConstant.fromHex("#ff74839d"),
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextSpan(
                        text: " Resend",
                        style: TextStyle(
                          color: ColorConstant.fromHex("#ff0061ff"),
                          fontSize: getFontSize(
                            16,
                          ),
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
