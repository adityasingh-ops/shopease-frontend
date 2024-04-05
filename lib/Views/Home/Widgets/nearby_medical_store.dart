import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Home/Widgets/storewidget.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/constants/uidata.dart';

class NearbyMedicalStore extends StatelessWidget {
  const NearbyMedicalStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (i) {
          var store = medicalrestaurants[i];
          return StoreWidget(
              image: store['imageUrl'],
              logo: store['logoUrl'],
              title: store['title'],
              time: store['time'],
              rating: store['ratingCount'],
              );
        }),
      ),
    );
  }
}