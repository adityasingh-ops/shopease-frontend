import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/Views/Home/Widgets/stores_tile.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/hooks/fetch_all_store.dart';
import 'package:shopease/models/stores_model.dart';

class AllNearByMedicalStores extends HookWidget {
  const AllNearByMedicalStores({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllStore("medical", "41007428");
    List<StoreModel>? allmedicalstores = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "Nearby Medical Stores",
          style: appStyle(13, kGray, FontWeight.w600),
        )
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading ? FoodsListShimmer(): Padding(
          padding: EdgeInsets.all( 12.h),
          child: ListView(
            children: List.generate(allmedicalstores!.length, (i) {
              StoreModel medicalstores = allmedicalstores[i];
              return StoreTile(restaurant: medicalstores);
            }),
          ),
        ),
      ),
    );
  }
}