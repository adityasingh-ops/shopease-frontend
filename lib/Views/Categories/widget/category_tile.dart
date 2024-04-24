import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Controllers/category_controller.dart';
import 'package:shopease/Views/Categories/category_page.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/categories.dart';

class Category_tile extends StatelessWidget {
   Category_tile({
    super.key,
    required this.category,
  });

  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return ListTile(
      onTap: (){
        controller.updateCategory = category.id;
        controller.updateTitle = category.title;
        Get.to(()=>CategoryPage(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500)
        );
      },
      leading:CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(category.imageUrl,fit: BoxFit.contain,),
      ),
      title: ReusableText(text: category.title, style: appStyle(12, kGray, FontWeight.normal)),
      trailing: Icon(Icons.arrow_forward_ios_rounded,color: kGray,size: 15,),
    );
  }
}