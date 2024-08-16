import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Controllers/cart_controller.dart';
import 'package:shopease/Controllers/category_controller.dart';
import 'package:shopease/Controllers/item_controller.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Home/Widgets/single_item.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/cart_request.dart';
import 'package:shopease/models/item_model.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.items});

  final ItemModel items;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemController());
    final cartcontroller = Get.put(CartController());
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ItemPage(
            item: items,
          ),
        );
        controller.updateItem = items.id;
        controller.updateTitle = items.title;
        controller.updateImage = items.imageUrl;
        controller.updateRating = "234";
        controller.updatePrice = items.price.toString();
        controller.updateDescription = items.description;
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              color: kLightWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9.r),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 70.h,
                          width: 70.w,
                          child: Image.network(
                            items.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                              color: kGray.withOpacity(0.6),
                              height: 16.h,
                              width: width,
                              child: RatingBarIndicator(
                                itemCount: 5,
                                rating: 5,
                                itemBuilder: (context, i) => const Icon(
                                  Icons.star,
                                  color: kSecondary,
                                ),
                                itemSize: 15.h,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: items.title,
                          style: appStyle(11, kDark, FontWeight.w400)),
                      ReusableText(
                          text: "Delivery time: ${items.time}",
                          style: appStyle(11, kGray, FontWeight.w400)),
                      SizedBox(
                          width: width * 0.7,
                          height: 15.h,
                          child: ListView.builder(
                            itemCount: items.additives.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              Additive additive = items.additives[i];
                              return Container(
                                margin: EdgeInsets.only(right: 5.w),
                                decoration: BoxDecoration(
                                  color: kSecondaryLight,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9.r)),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: ReusableText(
                                      text: additive.title,
                                      style:
                                          appStyle(8, kGray, FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
                width: 60.w,
                height: 19.h,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: ReusableText(
                    text: items.price.toString(),
                    style: appStyle(12, kLightWhite, FontWeight.w600),
                  ),
                )),
          ),
          Positioned(
            right: 75.w,
            top: 6.h,
            child: GestureDetector(
              onTap: () {
                var data = CartRequest( productId: items.id, quantity: 1, totalprice: items.price);
                String cart = cartRequestToJson(data);
                cartcontroller.addToCart(cart);
                print(cart);              },
              child: Container(
                width: 29.w,
                height: 29.h,
                decoration: BoxDecoration(
                  color: kSecondary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Icon(
                    MaterialCommunityIcons.cart_plus,
                    color: kLightWhite,
                    size: 15.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
