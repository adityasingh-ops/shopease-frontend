import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopease/Controllers/item_controller.dart';
import 'package:shopease/Views/Cart/Widget/cart_tile.dart';
import 'package:shopease/Views/Cart/Widget/order_page.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/custom_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';
import 'package:shopease/hooks/fetch_cart.dart';
import 'package:shopease/models/order_request.dart';
import 'package:slider_button/slider_button.dart';
import 'package:shopease/models/cart_response.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemController());
    final hookResult = useFetchCart();
    List<CartResponse>? cartItems = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    final refetch = hookResult.refetch;

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: ReusableText(
          text: 'Cart',
          style: appStyle(20, kGray, FontWeight.bold),
        )),
        backgroundColor: kOffWhite,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomContainer(
              color: kOffWhite,
              height: MediaQuery.of(context).size.height * 0.73,
              borderRadius:BorderRadius.only(
          bottomLeft: Radius.circular(0.r),
          bottomRight: Radius.circular(0.r),
        ),
        
              containerContent: isLoading
                  ? const FoodsListShimmer()
                  : Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: SizedBox(
                                width: width,
                                height: hieght,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: cartItems!.length,
                                  itemBuilder: (context, index) {
                                    var cartItem = cartItems[index];
                                    return CartTile(
                                      items: cartItem,
                                      refetch: refetch,
                                    );
                                  },
                                )),
                          ),
                        ),
                      ],
                    ),
            ),
            SliderButton(
              action: () async {
                await _onSliderButton(context,cartItems);
                return false;
              },
              label: Text(
                "Slide to Order",
                style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              icon: Icon(Icons.shopping_cart_outlined),
              width: width,
              radius: 30.r,
              buttonColor: kSecondary,
              backgroundColor: kGrayLight,
              highlightedColor: Colors.white,
              baseColor: kDark,
            ),
          ],
        ),
          
      ),
    );
  }

  Future<dynamic> _onSliderButton(BuildContext context,List<CartResponse>? cartItems) async {
    // Show a half container (or any other widget)
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height /
              1.7, // Half of the screen height
           decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
           ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    ReusableText(
                      text: "Order Summary",
                      style: appStyle(20, kDark, FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: "Total Items",
                          style: appStyle(16, kDark, FontWeight.w400),
                        ),
                        ReusableText(
                          text: cartItems!.length.toString(),
                          style: appStyle(16, kDark, FontWeight.w400),
                        ),
                      ],
                    ),
                    Divider(
                      color: kGray,
                      thickness: 1,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      color: kOffWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: cartItems.map((e) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150.w,
                                  child: ReusableText(
                                    text: e.productId.title,
                                    style: appStyle(16, kDark, FontWeight.w400),
                                  ),
                                ),
                                Row(
                                  children: [
                                    ReusableText(
                                      text: "₹ ${e.productId.price}",
                                      style: appStyle(16, kDark, FontWeight.w400),
                                    ),
                                    ReusableText(
                                      text: "* ${e.quantity} = ",
                                      style: appStyle(16, kDark, FontWeight.w400),
                                    ),
                                    ReusableText(
                                      text: "₹ ${e.totalprice}",
                                      style: appStyle(16, kDark, FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Divider(
                      color: kGray,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: "Total Price",
                          style: appStyle(16.h, kDark, FontWeight.w400),
                        ),
                        ReusableText(
                            text: "₹ ${cartItems.fold(0.0, (previousValue, element) => previousValue + element.totalprice)}",
                          style: appStyle(16, kDark, FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SliderButton(
              action: () async {
                await _Order(context,cartItems,cartItems.fold(0.0,(previousValue, element) => previousValue + element.totalprice));
                return false;
              },
              label: Text(
                "Slide to Chose time slot and order",
                style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              icon: Icon(Icons.shopping_cart_outlined),
              width: width,
              radius: 30.r,
              buttonColor: kSecondary,
              backgroundColor: kGrayLight,
              highlightedColor: Colors.white,
              baseColor: kDark,
            ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Future<dynamic> _Order(BuildContext context,List<CartResponse>? cartItems,double text) async {
     final box = GetStorage();
     var Orderitems = cartItems!.map((e) => OrderItem(itemId: e.productId.id,quantity:e.quantity, price: e.productId.price.toInt(), deliveryTime: [] )).toList();
    // Show a half container (or any other widget)
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return  Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Column(
             children: [
                Center(child: ReusableText(text: " ⏰ Select Your Time Slot", style: appStyle(16, kGray, FontWeight.w600))),
                SizedBox(height: 30.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                       
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: kGrayLight,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                       padding: EdgeInsets.only(left: 20.w,right: 20.w),
                                       
                        child: Column(
                          children: [
                            ReusableText(text: "ByEvening", style: appStyle(16, kDark, FontWeight.w600)),
                            ReusableText(text: "5:00 to 8:00", style: appStyle(13, kDark, FontWeight.w600)),
                            ReusableText(text: "free", style: appStyle(12, kRed, FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                       decoration: BoxDecoration(
                         color: kGrayLight,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.only(left: 20.w,right: 20.w),
                 
                      child: Column(
                        children: [
                          ReusableText(text: "Instant", style: appStyle(16, kDark, FontWeight.w600)),
                          ReusableText(text: "30 min", style: appStyle(13, kDark, FontWeight.w600)),
                          ReusableText(text: "₹ +40 extra", style: appStyle(12, kRed, FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
                 
                ),
                
             ],
            ),
          ),
          SizedBox(height: 20.h),
          ReusableText(text: "ToPay ${text}", style: appStyle(16, kGray, FontWeight.w600)),
          SizedBox(height: 20.h),
          GestureDetector(
            // onTap: (){
            //   var data = RequestOrder(userId: box.read('userId'), orderItem:Orderitems, ordertotal: text.toInt(), deliverycharge: 0, grandtotal: text.toInt(), deliveryAddress: , storeAddress: storeAddress, paymentMethod: paymentMethod, storeId: storeId, storecoords: storecoords, recipientcoords: recipientcoords, driverId: driverId, promoCode: promoCode, discount: discount);
            // },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: kPrimary,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.payment, color: kLightWhite),
                    SizedBox(width: 10.w),
                    ReusableText(text: "Cash On Delivery", style: appStyle(16, kLightWhite, FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: kSecondary,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 
                children: [
                  const Icon(Icons.payment_sharp, color: kLightWhite),
                  SizedBox(width: 10.w),
                  ReusableText(text: "UPI", style: appStyle(16.h, kLightWhite, FontWeight.w600)),
                ],
              ),
            ),
          ),
          ReusableText(text: "not available for some time 😔", style: appStyle(8.h, kRed, FontWeight.w600)),
        ],
      );
  
      },
    );
  }
}
