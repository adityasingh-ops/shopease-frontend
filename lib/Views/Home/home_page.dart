import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Views/Common/custom_app_bar.dart';
import 'package:shopease/Views/Common/custom_container.dart';
import 'package:shopease/Views/Common/heading.dart';
import 'package:shopease/Views/Home/Widgets/all_nearby_medical_Stores.dart';
import 'package:shopease/Views/Home/Widgets/all_nearby_services_stores.dart';
import 'package:shopease/Views/Home/Widgets/all_nearby_stores.dart';
import 'package:shopease/Views/Home/Widgets/category_list.dart';
import 'package:shopease/Views/Home/Widgets/nearby_medical_store.dart';
import 'package:shopease/Views/Home/Widgets/nearby_service_store.dart';
import 'package:shopease/Views/Home/Widgets/nearbystores_list.dart';
import 'package:shopease/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(preferredSize: Size.fromHeight(130.h),child:const CustomAppBar()),
      body: SafeArea(
        child:CustomContainer(
          containerContent: Column(
            children: [
             const CategoryList(),
             Heading(
              text: "Nearby Stores", 
              onTap:()
              {
                Get.to(()=> const AllNearByStores(),
                transition: Transition.cupertino,
                duration: const Duration(milliseconds: 500));
              }
              ),
              NearbyStores(),
              Heading(
              text: "Nearby Medical Stores", 
              onTap:()
              {
                Get.to(()=> const AllNearByMedicalStores(),
                transition: Transition.cupertino,
                duration: const Duration(milliseconds: 500));
              }
              ),
              NearbyMedicalStore(),
              Heading(
              text: "Nearby Service Stores", 
              onTap:()
              {
                Get.to(()=> const AllNearServiceByStores(),
                transition: Transition.cupertino,
                duration: const Duration(milliseconds: 500));
              }
              ),
              NearbyServiceStore(),
            ],
          ),
          ),
          ),
      );
  }
}