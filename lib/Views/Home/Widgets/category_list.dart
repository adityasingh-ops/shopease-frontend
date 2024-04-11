import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/shimmers/categories_shimmer.dart';
import 'package:shopease/Views/Home/Widgets/category_widget.dart';
import 'package:shopease/hooks/fetch_categories.dart';
import 'package:shopease/models/categories.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoryModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Container(
      height: 81.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const CatergoriesShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children:List.generate(categoriesList!.length, (i) {
                CategoryModel category = categoriesList[i];
                return CategoryWidget(category: category);
              }),
            ),
    );
  }
}
