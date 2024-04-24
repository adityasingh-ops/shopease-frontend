import 'package:flutter/material.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Home/Widgets/doctor_list.dart';
import 'package:shopease/constants/constants.dart';

class ServiceOrderPage extends StatelessWidget {
  const ServiceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
            text: "Appoint Your Doctor",
            style: appStyle(13, kGray, FontWeight.w600),
          )),
      body: DoctorsList(),
      );
  }
}