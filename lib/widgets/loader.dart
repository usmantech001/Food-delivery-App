import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customLoader(){
  return  Center(
        child: Container(
          alignment: Alignment.center,
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.sp),
            color: AppColors.mainColor,
          ),
          child: const CircularProgressIndicator(color: Colors.white, ),
        ),
      );
}