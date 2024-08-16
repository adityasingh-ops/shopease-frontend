import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:shopease/Controllers/store_controller.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/custom_app_bar.dart';
import 'package:shopease/Views/Common/item_tile.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/hooks/fetch_item.dart';
import 'package:shopease/models/item_model.dart';

class ItemList extends HookWidget {
  const ItemList({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreController());
    final hookResult = useFetchAllItems();
    List<ItemModel>? items = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    
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
                    image: controller.storeimage == null
                        ? null
                        : DecorationImage(
                            image: CachedNetworkImageProvider(controller.storeimage),
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
                  top: 40.h,
                  right: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      // Get.back();
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      
                      color: kPrimary,
                      size: 30.h,
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
                      borderRadius: BorderRadius.circular(20.h),
                      boxShadow: [
                        BoxShadow(
                    color: Colors.black.withOpacity(0.2.h),
                    spreadRadius: 1.h,
                    blurRadius: 5.h,
                    offset: const Offset(0, 5),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: controller.storetitle,
                            style: appStyle(20.h, kDark, FontWeight.bold),
                          ),
                          SizedBox(height: 8.h),
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
                              SizedBox(width: 8.h),
                              ReusableText(
                                text: controller.storerating,
                                style: appStyle(15, kDark, FontWeight.w400),
                              ),
                              SizedBox(width: 8.w),
                              ReusableText(
                                text: "comments",
                                style: appStyle(15, kDark, FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 7.3.h),
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
                                    text: controller.storetime,
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
                                    text: controller.storetime,
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
                                    text: controller.storetime,
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
              padding: EdgeInsets.only(left: 12.w),
              child: ReusableText(
                text: "Available Items",
                style: appStyle(15, kDark, FontWeight.bold),
              ),
            ),
            isLoading
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
                                Image.asset(
                                  "assets/anime/sorry1.gif",
                                  height: 50.h,
                                  width: 50.w,
                                ),
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
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          ItemModel item = items[index];
                          return ItemTile(items: item);
                        },
                      ),
          ],
        ),
      ),
    );
  }
}

