import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Controllers/store_controller.dart';
import 'package:shopease/Views/Common/item_tile.dart';
import 'package:shopease/Views/Common/shimmers/nearby_shimmer.dart';
import 'package:shopease/Views/Home/Widgets/item_list.dart';
import 'package:shopease/Views/Home/Widgets/medical_store_page.dart';
import 'package:shopease/Views/Home/Widgets/service_order_page.dart';
import 'package:shopease/Views/Home/Widgets/storewidget.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';
import 'package:shopease/hooks/fetch_store.dart';
import 'package:shopease/models/stores_model.dart';

class NearbyStores extends HookWidget {
  const NearbyStores({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreController());
    final hookResult = useFetchStore("allstore", "41007428");
    List<StoreModel>? allstores = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return isLoading
        ? const NearbyShimmer()
        : allstores == null || allstores.isEmpty
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
            : Container(
                height: 190.h,
                padding: EdgeInsets.only(left: 12.w, top: 10.h),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(allstores.length, (i) {
                    StoreModel store = allstores[i];
                    return StoreWidget(
                      image: store.imageUrl,
                      logo: store.logoUrl,
                      title: store.title,
                      time: store.time,
                      rating: "234",
                      onTap: () {
                        controller.updateStore = store.id;
                        controller.updateTime = store.time;
                        controller.updateTitle = store.title;
                        controller.updateImage = store.imageUrl;
                        controller.updateRating = store.rating.toString();
                        Get.to(() => ItemList(),
                          transition: Transition.cupertino,
                          duration: const Duration(milliseconds: 500));
                      },
                    );
                  }),
                ),
              );
  }
}
