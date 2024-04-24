import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Controllers/DoctorController.dart';
import 'package:shopease/Controllers/item_controller.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/expandable_text.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/hooks/fetch_single_item.dart';
import 'package:shopease/models/doctors.dart';
import 'package:shopease/models/item_model.dart';

class DoctorPage extends HookWidget {
  const DoctorPage(this.doctor, {super.key});
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: 310.h,
                  decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),

                    ),
                    image: controller.doctorImage == null
                        ? null
                        : DecorationImage(
                            image: CachedNetworkImageProvider(controller.doctorImage),
                            fit: BoxFit.cover,
                          ),
                  )
                ),
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Ionicons.chevron_back_circle,
                      color: kPrimary,
                      size: 35.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 180.h,
                  width: width,
                  height: 130.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kOffWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                     
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: controller.doctorName,
                            style: appStyle(20.h, kDark, FontWeight.bold),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return const Icon(
                                    Icons.star,
                                    color: kPrimary,
                                    size: 15,
                                  );
                                }),
                              ),
                              SizedBox(width: 10.w),
                              ReusableText(
                                text: controller.doctorCertificate,
                                style: appStyle(15, kDark, FontWeight.w400),
                              ),
                              SizedBox(width: 10.w),
                              ReusableText(
                                text: "comments",
                                style: appStyle(15, kDark, FontWeight.w400),
                              ),
                            ],
                          ),
                          
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle_sharp,
                                    size: 24.sp,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(width: 5.w),
                                  ReusableText(
                                    text: controller.doctorPatients,
                                    style: appStyle(15, kDark, FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 24.sp,
                                    color: kPrimary,
                                  ),
                                  SizedBox(width: 5.w),
                                  ReusableText(
                                    text: controller.doctorExperience,
                                    style: appStyle(15, kDark, FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 24.sp,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 5.w),
                                  ReusableText(
                                      text: controller.doctorPrice,
                                    style: appStyle(15, kDark, FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ReusableText(
                    text: "Description",
                    style: appStyle(17.h, kDark, FontWeight.w700),
                  ),
                  ExpandableText(
                    text: controller.doctorDescription,
                  ),
                  SizedBox(height: 10.h),
                  
                  SizedBox(height: 10.h),
                  
                ],
              ),
            ),
           
          ],
        )
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: kPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
               color: kSecondary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ReusableText(
                  text: "Rs.${controller.doctorPrice}",
                  style: appStyle(20.h, kOffWhite, FontWeight.w700),
                ),
              ),
            ),
            ReusableText(
              text: "Add to Cart",
              style: appStyle(20.h, kOffWhite, FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
