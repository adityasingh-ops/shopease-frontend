import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/constants/constants.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, this.onEditingComplete, this.keyboardType, this.initialValue,required this.controller, required this.hintText, required this.prefixIcon});
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String hintText;
  final Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark,
      initialValue: initialValue,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      onEditingComplete: onEditingComplete,
      controller: controller,
      validator: (value){
        if(value!.isEmpty){
          return "Email cannot be empty";
        }
        return null;
      },
      style: appStyle(12, kGray, FontWeight.normal),
      decoration: InputDecoration(
        hintText:hintText,
        prefixIcon: prefixIcon,
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