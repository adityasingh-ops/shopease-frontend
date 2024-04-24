import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.image, required this.price, required this.title, required this.time, this.onTap});
  final String image;
  final String price;
  final String title;
  final String time;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: width * .75,
          height: 180.h,
          decoration: BoxDecoration(
            color: kLightWhite,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 112.h,
                    width: width * .8,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                 ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ReusableText(text: title, style: appStyle(12, kDark, FontWeight.w500)),
                        ReusableText(text:  price, style: appStyle(12, kDark, FontWeight.w500)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(text: 'Free Delivery Time', style: appStyle(9, kGray, FontWeight.w500)),
                         ReusableText(text: time, style: appStyle(9, kDark, FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}