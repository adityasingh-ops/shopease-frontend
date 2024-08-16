import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Controllers/login_controller.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Profile/Widget/mobile_textfield.dart';
import 'package:shopease/Views/Profile/Widget/otp_verification.dart';
import 'package:shopease/Views/Profile/Widget/name_textfield.dart';
import 'package:shopease/constants/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:shopease/models/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _phoneController = TextEditingController();
  late final TextEditingController _nameController = TextEditingController();

  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        title: Center(child: ReusableText(text: 'ShopEase Family',style: appStyle(20, kLightWhite, FontWeight.bold),)),
        backgroundColor: kPrimary,),
        body: BackGroundContainer(color: kOffWhite, child: 
        ClipRRect(   
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r),topRight: Radius.circular(30.r)),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30.h,),
              Lottie.asset("assets/anime/delivery.json",),
              
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:  Column(
                  children: [
                   PhoneTextField(
                    hintText: "Enter Mobile no.",
                     prefixIcon: const Icon(CupertinoIcons.phone, size: 22,),
                     controller: _phoneController,
                     ),
                    SizedBox(height: 20.h,),
                    NameTextField(
                      controller: _nameController,
                    ),
                    SizedBox(height: 20.h,),
                    ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              minimumSize: Size(200.w, 40.h),
            ),
            onPressed: () {
              if(_phoneController.text.isEmpty ) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: ReusableText(
                      text: "Please fill all the fields",
                      style: appStyle(16, kLightWhite, FontWeight.bold),
                    ),
                    backgroundColor: kPrimary,
                  ),
                );
              } else if(_phoneController.text.length != 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: ReusableText(
                      text: "Please enter a valid mobile number",
                      style: appStyle(16, kLightWhite, FontWeight.bold),
                    ),
                    backgroundColor: kPrimary,
                  ),
                );
              } else {
                LoginModel model =  LoginModel(number: _phoneController.text, username: _nameController.text);
               String data = loginModelToJson(model);

               controller.loginfuction(data);
               Get.to(()=>OtpVerification(
                phoneNumber: _phoneController.text,
                username: _nameController.text,
               ));
              }
            },
            child: ReusableText(
              text: "L O G I N / S I G N U P",
              style: appStyle(16, kLightWhite, FontWeight.bold),
            ),)
                  ],
                ),
              ),

              
            ],
          ),
        )),
    );
  }
}