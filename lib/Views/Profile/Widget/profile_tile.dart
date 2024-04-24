import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.title, required this.icon, required this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: ReusableText(
        text: title,
        style: TextStyle(
          fontSize: 11.h,
          fontWeight: FontWeight.normal,
          color: kGray,
        ),
      ),
      leading: Icon(icon),
      onTap: onTap,
      trailing: title!="Settings"?const Icon(AntDesign.right,size: 16,):SvgPicture.asset("assets/icons/India1.svg",height: 20.h,width: 15.w,),
    );
  }
}