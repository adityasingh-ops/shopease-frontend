import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/Views/Home/Widgets/groccery_store_tile.dart';
import 'package:shopease/Views/Home/Widgets/stores_tile.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/hooks/fetch_all_store.dart';
import 'package:shopease/models/stores_model.dart';

class AllNearByStores extends HookWidget {
  const AllNearByStores({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllStore("allstore", "41007428");
    List<StoreModel>? allstores = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
            text: "Nearby Stores",
            style: appStyle(13, kGray, FontWeight.w600),
          )),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  children: List.generate(allstores!.length, (i) {
                    StoreModel stores = allstores[i];
                    return GrocceryStoreTile(store: stores);
                  }),
                ),
              ),
      ),
    );
  }
}
