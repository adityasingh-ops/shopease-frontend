import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/custom_container.dart';
import 'package:shopease/Views/Common/custom_textfield.dart';
import 'package:shopease/constants/constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 74.h,
        automaticallyImplyLeading: false,

        backgroundColor: kOffWhite,
        //title: CustomTextWidget(keyboardType: keyboardType, controller: controller, obscureText: obscureText),
      ),
      body: SafeArea(
        child:CustomContainer(containerContent: Container()) ),
      );
  }
}