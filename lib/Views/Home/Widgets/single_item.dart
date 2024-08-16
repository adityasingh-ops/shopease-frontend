import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shopease/Controllers/cart_controller.dart';
import 'package:shopease/Controllers/item_controller.dart';
import 'package:shopease/Views/Cart/cart_page.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/expandable_text.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/hooks/fetch_single_item.dart';
import 'package:shopease/models/cart_request.dart';
import 'package:shopease/models/decreament.dart';
import 'package:shopease/models/item_model.dart';

class ItemPage extends HookWidget {
  const ItemPage({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final controller = Get.put(ItemController());
    final cartcontroller = Get.put(CartController());
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
                    image: controller.itemimage == null
                        ? null
                        : DecorationImage(
                            image: CachedNetworkImageProvider(
                                controller.itemimage),
                            fit: BoxFit.cover,
                          ),
                  )),
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
                    Get.to(() => const CartPage());
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: kPrimary,
                    size: 35.h
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
                          text: controller.itemtitle,
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
                            SizedBox(width: 10.w),
                            ReusableText(
                              text: controller.itemrating,
                              style: appStyle(15, kDark, FontWeight.w400),
                            ),
                            SizedBox(width: 10.w),
                            ReusableText(
                              text: "comments",
                              style: appStyle(15, kDark, FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle_sharp,
                                  size: 24.h,
                                  color: Colors.yellow,
                                ),
                                SizedBox(width: 5.w),
                                ReusableText(
                                  text: controller.itemprice,
                                  style: appStyle(15, kDark, FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 24.h,
                                  color: kPrimary,
                                ),
                                SizedBox(width: 5.w),
                                ReusableText(
                                  text: controller.itemprice,
                                  style: appStyle(15, kDark, FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 24.h,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 5.w),
                                ReusableText(
                                  text: controller.itemprice,
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
                  text: controller.itemdescription,
                ),
                SizedBox(height: 10.h),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Quantity",
                        style: appStyle(15.h, kGray, FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: kOffWhite,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                              controller.decrement();
                              

                              },
                              icon: Icon(
                                Icons.remove,
                                color: kPrimary,
                              ),
                            ),
                            ReusableText(
                              text: controller.count.value.toString(),
                              style: appStyle(15.h, kDark, FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                      //          var data = CartRequest( productId: item.id, quantity: 1, totalprice: item.price);
                      //  String cart = cartRequestToJson(data);
                      //  cartcontroller.addToCart(cart);
                      controller.increment();
                              },
                              icon: Icon(
                                Icons.add,
                                color: kPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 30.h,left: 10.w,right: 10.w),
        height: 60.h,
        width: width,
        decoration: BoxDecoration(
          color: kPrimary,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width*0.4,
                height: 30.h,
                decoration: BoxDecoration(
                  color: kOffWhite,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: [
                    BoxShadow(
                      color: kGray.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Obx(() => ReusableText(
                    text: "₹ ${controller.itemprice}*${controller.count}",
                    style: appStyle(20.h, kPrimary, FontWeight.w700),
                  ),)
                ),
              ),
              Row(
                children: [
                  ReusableText(
                    text: "Add to Cart",
                    style: appStyle(15.h, kOffWhite, FontWeight.w700),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 80.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        
                         var data = CartRequest( productId: item.id, quantity: controller.count.toInt(), totalprice: item.price);
                       String cart = cartRequestToJson(data);
                       cartcontroller.addToCart(cart);
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        color: kOffWhite,
                        size: 30.h,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
