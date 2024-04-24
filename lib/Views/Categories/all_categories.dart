import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Categories/widget/category_tile.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';
import 'package:shopease/hooks/fetch_all_category.dart';
import 'package:shopease/models/categories.dart';

class AllCategory extends HookWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    List<CategoryModel>? allcategories = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
            text: "Categories", style: appStyle(12, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: hieght,
          child: isLoading
              ? FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(allcategories!.length, (i) {
                    CategoryModel category = allcategories[i];
                    return Category_tile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
