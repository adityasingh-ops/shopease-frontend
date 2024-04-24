import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Views/Common/shimmers/nearby_shimmer.dart';
import 'package:shopease/Views/Home/Widgets/medical_store_page.dart';
import 'package:shopease/Views/Home/Widgets/single_item.dart';
import 'package:shopease/Views/Home/Widgets/storewidget.dart';
import 'package:shopease/hooks/fetch_store.dart';
import 'package:shopease/models/stores_model.dart';

class NearbyMedicalStores extends HookWidget {
  const NearbyMedicalStores({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult  = useFetchStore("medical","41007428");
    List<StoreModel>? allmedicalstores = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return isLoading? const NearbyShimmer(): Container(
      height: 190.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(allmedicalstores!.length, (i) {
          StoreModel store = allmedicalstores[i];
          return StoreWidget(
              image: store.imageUrl,  
              logo: store.logoUrl,
              title: store.title,
              time: store.time,
              rating: "kfjs",
              onTap: () {
                 Get.to(()=>OrderPage());
              
              },
              );
        }),
      ),
    );
  }
}
