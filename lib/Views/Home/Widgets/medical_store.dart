import 'package:flutter/material.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';

class MedicalStore extends StatelessWidget {
  const MedicalStore({super.key,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
            text: text,
            style: appStyle(13, kGray, FontWeight.w600),
          )),
    );
  }
}