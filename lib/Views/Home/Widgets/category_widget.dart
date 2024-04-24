import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopease/Controllers/category_controller.dart';
import 'package:shopease/Views/Categories/all_categories.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/categories.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
   CategoryWidget({
    super.key,
    required this.category,
  });

  CategoryModel category;

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(CategoryController());
    return GestureDetector(
        onTap: () {
          if (controller.categoryvalue == category.id) {
            controller.updateCategory = '';
            controller.updateTitle = '';
          } else if (category.value == 'more') {
            Get.to(() => const AllCategory(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 500));
          } else{
            controller.updateCategory = category.id;
            controller.updateTitle = category.title;
          }
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.only(top: 4.h),
            width: width * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: controller.categoryvalue == category.id ? kSecondary: kOffWhite, width: .5.w),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                  child: Image.network(
                    category.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                ReusableText(
                    text: category.title,
                    style: appStyle(12, kDark, FontWeight.normal),
                    )
              ],
            ),
          ),
        ));
  }
}
