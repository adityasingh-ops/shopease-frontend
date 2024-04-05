import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopease/Views/Categories/category_page.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';

class Category_tile extends StatelessWidget {
   Category_tile({
    super.key,
    required this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Get.to(()=>CategoryPage(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500)
        );
      },
      leading:CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(category['imageUrl'],fit: BoxFit.contain,),
      ),
      title: ReusableText(text: category['title'], style: appStyle(12, kGray, FontWeight.normal)),
      trailing: Icon(Icons.arrow_forward_ios_rounded,color: kGray,size: 15,),
    );
  }
}