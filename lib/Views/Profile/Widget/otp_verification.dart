import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:shopease/Controllers/login_controller.dart';
import 'package:shopease/Controllers/otp_controller.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Profile/Widget/login_page.dart';
import 'package:shopease/Views/entrypoint.dart';
import 'package:shopease/constants/constants.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shopease/models/otpverification.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification(
      {super.key, required this.phoneNumber, required this.username});
  final String phoneNumber;
  final String username;
  @override
  Widget build(BuildContext context) {
    String? otp1;
    final controller = Get.put(OtpController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: ReusableText(
          text: 'ShopEase Family',
          style: appStyle(20, kLightWhite, FontWeight.bold),
        )),
        backgroundColor: kPrimary,
      ),
      body: BackGroundContainer(
          color: kOffWhite,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r)),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                // Lottie.asset(
                //   "assets/anime/delivery.json",
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      OTPTextField(
                        length: 4,
                        width: MediaQuery.of(context).size.width + 10.h,
                        fieldWidth: 80,
                        onChanged: (pin) {
                          
                        },
                        style: TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {
                          if (pin != null) {
                            print("yout otp for the app is this please print it again"+pin);
                            OtpModel model = OtpModel(
                                otp: pin,
                                number: phoneNumber,
                                username: username,
                                );
                            String data = otpModelToJson(model);
                            controller.verifyOTP(data);
                          } else {
                            // Handle the case when otp1 is null
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          minimumSize: Size(200.w, 40.h),
                        ),
                        onPressed: () {
                          // print(otp1);
                        },
                        child: ReusableText(
                          text: "Verify OTP",
                          style: appStyle(16, kLightWhite, FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => LoginPage());
                          },
                          child: ReusableText(
                            text: "edit phone",
                            style: appStyle(16, kPrimary, FontWeight.normal),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
