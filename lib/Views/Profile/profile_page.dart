import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/custom_container.dart';
import 'package:shopease/Views/Common/profile_appbar.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Profile/Widget/login_page.dart';
import 'package:shopease/Views/Profile/Widget/profile_tile.dart';
import 'package:shopease/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h), child: const ProfileAppBar()),
      body: SafeArea(
          child: CustomContainer(
              containerContent: Column(
        children: [
          Container(
            width: width,
            height: hieght * 0.06,
            color: kOffWhite,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 2.h, 0, 2.h),
                  child: CircleAvatar(
                    radius: 24.r,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Change to MainAxisAlignment.end
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                              text: "Username",
                              style: appStyle(16, kGray, FontWeight.bold)),
                          ReusableText(
                              text: "usernama@gmail.com",
                              style: appStyle(12, kGray, FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Icon(
                            Ionicons.create_outline,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 145.h,
            decoration: BoxDecoration(
              color: kLightWhite,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ProfileTile(
                    title: "My Orders",
                    icon: Ionicons.cart_outline,
                    onTap: () {}),
                ProfileTile(
                    title: "Help Center",
                    icon: Ionicons.help_circle_outline,
                    onTap: () {}),
                ProfileTile(
                    title: "write a review",
                    icon: Ionicons.create_outline,
                    onTap: () {}),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 145.h,
            decoration: BoxDecoration(
              color: kLightWhite,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ProfileTile(
                    title: "Shipping Address",
                    icon: Ionicons.location_outline,
                    onTap: () {
                      Get.to(() => LoginPage());
                    }),
                ProfileTile(
                    title: "App Feedback",
                    icon: Ionicons.chatbox_ellipses_outline,
                    onTap: () {}),
                ProfileTile(
                    title: "Settings",
                    icon: Ionicons.settings_outline,
                    onTap: () {}),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              minimumSize: Size(200.w, 40.h),
            ),
            onPressed: () {
              // logout functionality
            },
            child: ReusableText(
              text: "Logout",
              style: appStyle(16, kLightWhite, FontWeight.bold),
            ),)
        ],
      ))),
    );
  }
}
