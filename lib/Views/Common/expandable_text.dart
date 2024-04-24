import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/resuable_text_2.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';


class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firsthalf;
  late String secondhalf;
  bool flag = true;
  // double textheight =Dimension.screenHeight/5;
  double textheight = 100;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textheight) {
      firsthalf = widget.text.substring(0, textheight.toInt());
      secondhalf = widget.text.substring(textheight.toInt()+1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondhalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // SmallText(text: firsthalf,size: Dimension.font16,color: AppColors.textColor,)
      child: secondhalf.isEmpty?ReusableText2(text: firsthalf, style: appStyle(14, kGray, FontWeight.normal)):Column(
        children: [
          // SmallText(text:flag?firsthalf + "...":firsthalf + secondhalf,size: Dimension.font16,color: AppColors.textColor,height: 1.8,),
          ReusableText2(text:flag?firsthalf + "...":firsthalf + secondhalf , style: appStyle(14, kDark, FontWeight.normal),),
          InkWell(
            onTap: (){
              setState(() {
                flag = !flag;
              });
            },
            child: Row(
              children: [
                ReusableText2(text: flag?"Read More":"Read Less" , style: appStyle(12, kPrimary, FontWeight.normal),),
                Icon(flag?Icons.arrow_drop_down:Icons.arrow_drop_up,color: kPrimary,size: 24.h,),
              ],
            ),
          ),
        ],
      )
    );
  }
}