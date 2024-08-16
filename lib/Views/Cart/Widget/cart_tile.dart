import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shopease/Controllers/cart_controller.dart';
import 'package:shopease/Controllers/category_controller.dart';
import 'package:shopease/Controllers/item_controller.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Home/Widgets/single_item.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/cart_request.dart';
import 'package:shopease/models/cart_response.dart';
import 'package:shopease/models/decreament_request.dart';
import 'package:shopease/models/item_model.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.items,this.refetch});

  final CartResponse items;
  final Function()? refetch;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final box = GetStorage();
    return GestureDetector(
      onTap: () {
        // // Get.to(()=>ItemPage(item: items,),
        // );
        // controller.updateItem = items.id;
        // controller.updateTitle = items.title;
        // controller.updateImage = items.imageUrl;
        // controller.updateRating = "234";
        // controller.updatePrice = items.price.toString();
        // controller.updateDescription = items.description;
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
                            items.productId.imageUrl,
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
                      Container(
                       
                        child: ReusableText(
                            text: items.productId.title,
                            style: appStyle(11, kDark, FontWeight.w400)),
                      ),
                      Container(
                       
                        child: Row(
                          children: [
                            ReusableText(
                                text: "Price: ${items.productId.price}",
                                style: appStyle(11, kGray, FontWeight.w400)),
                                 ReusableText(
                            text: " x ${items.quantity}",
                            style: appStyle(11, kGray, FontWeight.w400)),
                          ],
                        ),
                      ),
                         
                      
                      Container(
                width: 60.w,
                height: 19.h,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: ReusableText(
                    text: items.totalprice.toStringAsFixed(2),
                    style: appStyle(12, kLightWhite, FontWeight.w600),
                  ),
                )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top:10.h,
            child:Container(
                   
                height: 35.h,
                decoration: BoxDecoration(
                  border: Border.all(color: kSecondary),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                              var data = DecreamentRequest(userId:box.read('userId') , productId: items.productId.id);
                       String cart = decreamentRequestToJson(data);
                       controller.decreament(cart,refetch!);
                              

                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: kSecondary,
                                
                              ),
                            ),
                            
                            ReusableText(
                              text: items.quantity.toString(),
                              style: appStyle(12.h, kDark, FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                               var data = CartRequest( productId: items.productId.id, quantity: 1, totalprice: items.productId.price);
                       String cart = cartRequestToJson(data);
                       controller.addToCartMore(cart,refetch!);
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: kSecondary,
                             
                              ),
                            ),
                          ],
                        ),
                      ), ),
                      
          Positioned(
            right: 110.w,
            top: 20.h,
            child: GestureDetector(
              onTap: () {
                controller.removeProduct(items.id, refetch!);
              },
              child: Container(
                width: 29.w,
                height: 29.h,
                decoration: BoxDecoration(
                color: kRed,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Icon(
                    MaterialCommunityIcons.trash_can,
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
