import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';

class OrderPage extends StatelessWidget {
   OrderPage({super.key, required this.text});
  double text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
             children: [
                Center(child: ReusableText(text: " ⏰ Select Your Time Slot", style: appStyle(16, kGray, FontWeight.w600))),
                SizedBox(height: 30.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                       
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: kGrayLight,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                       padding: EdgeInsets.only(left: 20.w,right: 20.w),
                                       
                        child: Column(
                          children: [
                            ReusableText(text: "ByEvening", style: appStyle(16, kDark, FontWeight.w600)),
                            ReusableText(text: "5:00 to 8:00", style: appStyle(13, kDark, FontWeight.w600)),
                            ReusableText(text: "free", style: appStyle(12, kRed, FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                       decoration: BoxDecoration(
                         color: kGrayLight,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.only(left: 20.w,right: 20.w),
                 
                      child: Column(
                        children: [
                          ReusableText(text: "Instant", style: appStyle(16, kDark, FontWeight.w600)),
                          ReusableText(text: "30 min", style: appStyle(13, kDark, FontWeight.w600)),
                          ReusableText(text: "₹ +40 extra", style: appStyle(12, kRed, FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
                 
                ),
                
             ],
            ),
          ),
          SizedBox(height: 20.h),
          ReusableText(text: "ToPay ${text}", style: appStyle(16, kGray, FontWeight.w600)),
          SizedBox(height: 20.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kPrimary,
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.payment, color: kLightWhite),
                  SizedBox(width: 10.w),
                  ReusableText(text: "Cash On Delivery", style: appStyle(16, kLightWhite, FontWeight.w600)),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kPrimary,
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 
                children: [
                  Icon(Icons.payment_sharp, color: kLightWhite),
                  SizedBox(width: 10.w),
                  ReusableText(text: "UPI", style: appStyle(16, kLightWhite, FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}