import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shopease/Controllers/search_controller.dart';
import 'package:shopease/Views/Common/item_tile.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/item_model.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchItemController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: hieght,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.searchResults!.length,
          itemBuilder: (context, i) {
            ItemModel item = controller.searchResults![i];
            return ItemTile(items: item);
          }),
    );
  }
}
