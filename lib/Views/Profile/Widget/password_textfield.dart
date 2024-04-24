import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/constants/constants.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key,required this.controller});
  
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      controller: controller,
      validator: (value){
        if(value!.isEmpty){
          return "Password cannot be empty";
        }
        return null;
      },
      style: appStyle(12, kGray, FontWeight.normal),
      decoration: InputDecoration(
        hintText:"Password",
        prefixIcon: Icon(CupertinoIcons.lock_circle, size: 22,),
        isDense: true,
        contentPadding: EdgeInsets.all(6.h),
        hintStyle: appStyle(12, kGray, FontWeight.normal),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed,width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed,width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary,width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kGray,width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary,width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary,width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}