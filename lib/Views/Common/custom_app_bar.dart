import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: kSecondary,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom:6.h,left: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(text: "Delivery to", style: appStyle(13, kSecondary, FontWeight.w600)),
                      SizedBox(
                        width: width*0.65,
                        child: Text("224407 kushinagar UP",overflow: TextOverflow.ellipsis, style: appStyle(11, kGrayLight, FontWeight.normal))),
                    ],
                  ),
                ),
                 Text(getTimeOfDay(),style: const TextStyle(fontSize: 35),)
              ],
            ),
          ],
        ),
      ),
    );
  }
  String getTimeOfDay(){
    DateTime now = DateTime.now();
    int hour = now.hour;

    if(hour>=0 && hour<12){
      return '☀️';
    }else if(hour>=12 && hour<16){
      return '⛅';
    }else{
      return '🌙';
    }
  }
}