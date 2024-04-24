import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kOffWhite,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          // logout fuctionality
        },
        child: Icon(
          AntDesign.logout,
          color: kDark,
          size: 18.h,
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {
              // edit profile functionality
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/India1.svg",
                    height: 25.h,
                    width: 15.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    width: 1.w,
                    height: 15.h,
                    color: kGrayLight,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  ReusableText(
                    text: "IND",
                    style: appStyle(16, kDark, FontWeight.normal),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        // settings functionality
                      },
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Icon(
                      SimpleLineIcons.settings,
                      size: 18.h,

                    ),
                  )),
                ],
              ),
            )),
      ],
    );
  }
}
