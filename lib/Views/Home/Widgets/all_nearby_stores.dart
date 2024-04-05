import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Home/Widgets/stores_tile.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';

class AllNearByStores extends StatelessWidget {
  const AllNearByStores({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: EdgeInsets.all( 12.h),
          child: ListView(
            children: List.generate(restaurants.length, (i) {
              var stores = restaurants[i];
              return StoreTile(restaurant: stores);
            }),
          ),
        ),
      ),
    );
  }
}
