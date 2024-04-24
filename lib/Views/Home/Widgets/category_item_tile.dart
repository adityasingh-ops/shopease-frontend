import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Controllers/category_controller.dart';
import 'package:shopease/Views/Common/item_tile.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/Views/Home/Widgets/single_item.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/hooks/fetch_all_category_item.dart';
import 'package:shopease/models/item_model.dart';

class CategoryItemTile extends HookWidget{
  const CategoryItemTile({super.key});
  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategoryItems("41007428");
    final List<ItemModel>? items = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return GestureDetector(
      onTap: () {
      },
      child: SizedBox(
        height: hieght,
        width: width,
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
              children: List.generate(items.length, (i){
                ItemModel item = items[i];
                return ItemTile(items: item);
              }),
            ),
            ),
      ),
    );
  }
}