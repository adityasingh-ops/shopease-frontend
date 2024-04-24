import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shopease/Controllers/category_controller.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/item_tile.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/hooks/fetch_all_category_item.dart';
import 'package:shopease/models/item_model.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResult = useFetchAllCategoryItems("41007428");
    final List<ItemModel>? items = hookResult.data;
    final isLoading = hookResult.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(text: "${controller.titlevalue}", style: appStyle(12, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          // padding: EdgeInsets.only(top: 10.h, left: 12.w),
          height: hieght,
          child: isLoading
        ? const FoodsListShimmer()
        : items == null || items.isEmpty
            ? Center(
                child: Container(
                  height: 90.h,
                  width: 0.9.sw,
                  decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //  Image.asset("assets/anime/sorry1.gif", height: 50.h, width: 50.w),
                        Text(
                          "No Service Stores Nearby",
                          style: TextStyle(
                            color: kPrimary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
              )
            :
        Padding(
          padding:  EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(items!.length, (i){
              ItemModel item = items[i];
              return ItemTile(items: item);
            }),
          ),
          ),
        ), 
        ),
    );
  }
}