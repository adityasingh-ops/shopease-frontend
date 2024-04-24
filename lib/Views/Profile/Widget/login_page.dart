import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Profile/Widget/email_textfield.dart';
import 'package:shopease/Views/Profile/Widget/password_textfield.dart';
import 'package:shopease/constants/constants.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();

  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        title: Center(child: ReusableText(text: 'ShopEase Family',style: appStyle(20, kLightWhite, FontWeight.bold),)),
        backgroundColor: kPrimary,),
        body: BackGroundContainer(child: 
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r),topRight: Radius.circular(30.r)),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30.h,),
              Lottie.asset("assets/anime/delivery.json",),
              
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child:  Column(
                  children: [
                   EmailTextField(
                    hintText: "Enter Email",
                     prefixIcon: Icon(CupertinoIcons.mail, size: 22,),
                     controller: _emailController,
                     ),
                    SizedBox(height: 20.h,),
                    PasswordTextField(controller: _passwordController),
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
              // logout functionality
            },
            child: ReusableText(
              text: "L O G I N",
              style: appStyle(16, kLightWhite, FontWeight.bold),
            ),)
                  ],
                ),
              ),

              
            ],
          ),
        )
        , color: kOffWhite),
    );
  }
}