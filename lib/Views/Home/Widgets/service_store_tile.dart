import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';

class ServiceStoreTile extends StatelessWidget {
  ServiceStoreTile({super.key, required this.servicestore});

  final dynamic servicestore;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              color: kLightWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9.r),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 70.h,
                          width: 70.w,
                          child: Image.network(
                            servicestore['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          child:Container(
                            padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                            color: kGray.withOpacity(0.6),
                            height: 16.h,
                            width: width*0.1,
                            child: RatingBarIndicator(
                              itemCount: 5,
                              rating: 5,
                              itemBuilder: (context,  i) =>
                                  const Icon(Icons.star, color: kSecondary,),
                                  itemSize: 15.h,)
                          ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(text: servicestore["title"], style: appStyle(11, kDark,FontWeight.w400)),
                       ReusableText(text: "Delivery time: ${servicestore['title']}", style: appStyle(11, kGray,FontWeight.w400)),
                       SizedBox(
                        width: width * 0.7,
                        
                        child: Text(servicestore['coords']['address'],
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(9, kGray, FontWeight.w400),),
                       ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 60.w,
              height: 19.h,
              decoration: BoxDecoration(
                color:servicestore['isAvailable']==true || servicestore['isAvailable'] ==null ? kPrimary : kSecondaryLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text: servicestore['isAvailable']==true || servicestore['isAvailable'] ==null ? "Open" : "Closed",
                  style: appStyle(12, kLightWhite, FontWeight.w600),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
