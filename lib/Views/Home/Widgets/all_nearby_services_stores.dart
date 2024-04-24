import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/Views/Home/Widgets/medical_store_tile.dart';
import 'package:shopease/Views/Home/Widgets/stores_tile.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';
import 'package:shopease/hooks/fetch_all_store.dart';
import 'package:shopease/models/stores_model.dart';

class AllNearServiceByStores extends HookWidget {
  const AllNearServiceByStores({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllStore("service","41007428");
    List<StoreModel>? servicerestores = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "Nearby Service Stores",
          style: appStyle(13, kGray, FontWeight.w600),
        )
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading ?
         const FoodsListShimmer()
         : servicerestores == null || servicerestores.isEmpty?
        Center(
          child: Container(
            height: 90.h,
            width: 0.9.sw,
            decoration: BoxDecoration(
              color: kOffWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Image.asset("assets/anime/sorry1.gif", height: 50.h, width: 50.w),
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
        :Padding(
          padding: EdgeInsets.all( 12.h),
          child: ListView(
            children: List.generate(servicerestores!.length, (i) {
              StoreModel servicestores = servicerestores[i];
              return StoreTile(restaurant: servicestores);
            }),
          ),
        ),
      ),
    );
  }
}