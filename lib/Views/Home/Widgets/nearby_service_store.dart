import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Views/Common/shimmers/nearby_shimmer.dart';
import 'package:shopease/Views/Home/Widgets/medical_store_page.dart';
import 'package:shopease/Views/Home/Widgets/service_order_page.dart';
import 'package:shopease/Views/Home/Widgets/storewidget.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';
import 'package:shopease/hooks/fetch_store.dart';
import 'package:shopease/models/stores_model.dart';

class NearbyServiceStores extends HookWidget {
  const NearbyServiceStores({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchStore("service", "41007428");
    List<StoreModel>? allservicestores = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return isLoading
        ? const NearbyShimmer()
        : allservicestores == null || allservicestores.isEmpty
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
            : Container(
                height: 190.h,
                padding: EdgeInsets.only(left: 12.w, top: 10.h),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(allservicestores.length, (i) {
                    StoreModel store = allservicestores[i];
                    return StoreWidget(
                      image: store.imageUrl,
                      logo: store.logoUrl,
                      title: store.title,
                      time: store.time,
                      rating: "kfjs",
                      onTap: () {
                        Get.to(() => ServiceOrderPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 500));
                      },
                    );
                  }),
                ),
              );
  }
}
