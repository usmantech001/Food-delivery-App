import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors/constants.dart';
import '../detail/widgets.dart';
import '../signIn/sign_in_widget.dart';

Widget favoriteContainer(){
  return Container(
      margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Container(
            height: 120.h,
            width: 120.w,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: Colors.white,
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: NetworkImage(
                //         '${AppConstants.BASEURL}/uploads/${}'))
                ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 105,
                          child: reuseableDetailText('rice', size: 22)),
                          Icon(Icons.cancel)
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        reuseableText('\$2.00', size: 20.sp, color: Colors.deepPurple.shade800),
                       
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

}
