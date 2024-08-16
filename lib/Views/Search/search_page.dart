import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopease/Controllers/search_controller.dart';
import 'package:shopease/Views/Common/custom_container.dart';
import 'package:shopease/Views/Common/custom_textfield.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/Views/Search/loading_widget.dart';
import 'package:shopease/Views/Search/search_result.dart';
import 'package:shopease/constants/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchItemController());
    return Obx(() => Scaffold(
          backgroundColor: kPrimary,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 74.h,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: CustomTextWidget(
                keyboardType: TextInputType.text,
                controller: _searchController,
                hinttext: "Search your product",
                obscureText: false,
                onChanged: (value) {
                 
                    if (value.isEmpty) {
    _searchController.clear();// Reset search results to null
  } else {
    controller.setSearchResults(value); // Set search results
  }
                  
                },
                // suffixIcon: GestureDetector(
                //   onTap: () {
                //     if (controller.isTriggered == false) {
                //       controller.setSearchResults(_searchController.text);
                //       controller.setTriggered = true;
                //     } else {
                //       controller.searchResults = null;
                //       controller.setTriggered = false;
                //       _searchController.clear();
                //     }
                //   },
                //   child: controller.isTriggered == false
                //       ? Icon(
                //           Ionicons.search_circle,
                //           size: 40.h,
                //           color: kPrimary,
                //         )
                //       : Icon(
                //           Ionicons.close_circle,
                //           color: kRed,
                //           size: 40.h,
                //         ),
                // ),
              ),
            ),
          ),
          body: SafeArea(
              child: CustomContainer(
                  color: Colors.white,
                  containerContent: controller.isLoading
                      ? const FoodsListShimmer()
                      : controller.searchResults == null
                          ? const LoadingWidget()
                          : const SearchResult())),
        ));
  }
}
