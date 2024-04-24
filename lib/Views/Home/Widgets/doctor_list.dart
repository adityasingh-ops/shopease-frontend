import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/Views/Common/shimmers/foodlist_shimmer.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/hooks/fetch_all_doctors.dart';
import 'package:shopease/models/doctors.dart';

class DoctorsList extends HookWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllDoctors();
    List<DoctorModel>? allDoctors = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return isLoading? FoodsListShimmer(): Container(
      child: ListView.builder(
        itemCount: allDoctors!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.h),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.h,
                  blurRadius: 5.h,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                 
                  children: [
                    CircleAvatar(
                      radius: 30.h,
                      backgroundImage: NetworkImage(allDoctors![index].image),),
                    SizedBox(
                      width: 10.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 150.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(text: allDoctors[index].name, style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                                ReusableText(text: "Experience : ${allDoctors[index].experience} ", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Container(
                              padding: EdgeInsets.all(5.h),
                              decoration: BoxDecoration(
                                color: kOffWhite,
                                borderRadius: BorderRadius.circular(30.h),
                              ),
                              child: ReusableText(text: 'Rs : ${allDoctors[index].price}', style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: kDark,
                              ),),
                            ),
                          ],
                        ),
                        
                        ReusableText(text: 'Title : ${allDoctors[index].title}', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),),
                         ReusableText(text: 'Address : ${allDoctors[index].address}', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),),
                        
                      ],
                    ),
                   
                  ],
                ),
              
              ],
            ),
          );
        },
      ),


    );
  }
}