import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopease/Controllers/category_controller.dart';
import 'package:shopease/Views/Common/custom_app_bar.dart';
import 'package:shopease/Views/Common/custom_container.dart';
import 'package:shopease/Views/Common/heading.dart';
import 'package:shopease/Views/Home/Widgets/all_nearby_medical_Stores.dart';
import 'package:shopease/Views/Home/Widgets/all_nearby_services_stores.dart';
import 'package:shopease/Views/Home/Widgets/all_nearby_stores.dart';
import 'package:shopease/Views/Home/Widgets/category_item_tile.dart';
import 'package:shopease/Views/Home/Widgets/category_list.dart';
import 'package:shopease/Views/Home/Widgets/nearby_medical_store.dart';
import 'package:shopease/Views/Home/Widgets/nearby_service_store.dart';
import 'package:shopease/Views/Home/Widgets/nearbystores_list.dart';
import 'package:shopease/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(preferredSize: Size.fromHeight(130.h),child:const CustomAppBar()),
      body: SafeArea(
         
        child:CustomContainer(
          containerContent: Column(
            children: [
             const CategoryList(),
            Obx(() =>controller.categoryvalue == '' ?Column(
               children: [
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
                  NearbyMedicalStores(),
                  Heading(
                  text: "Nearby Service Stores", 
                  onTap:()
                  {
                    Get.to(()=> const AllNearServiceByStores(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 500));
                  }
                  ),
                  NearbyServiceStores(),
               ],
             ): 
             CustomContainer(containerContent: 
             Column(
              children: [
                Heading(
                  more: true,
                  text: controller.titlevalue, 
                  ),
                const CategoryItemTile(),
              ],
             ),
             ),
            ),
            ],
          ),
          ),
          ),
      );
  }
}