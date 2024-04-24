import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/constants/constants.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.keyboardType, required this.controller, this.onEditingComplete, required this.obscureText, this.suffixIcon, this.validator, this.prefixIcon, required this.hinttext});
  final TextInputType keyboardType;
  final TextEditingController controller;
  final void Function()? onEditingComplete;
  final  bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hinttext;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.r),
        border: Border.all(color: Colors.grey, width: 0.4),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText ?? false,
        cursorHeight: 20.h,
        style: appStyle(11, kDark, FontWeight.normal),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: appStyle(11, kDark,FontWeight.normal),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hinttext,
        ),
      ),
    );
  }
}