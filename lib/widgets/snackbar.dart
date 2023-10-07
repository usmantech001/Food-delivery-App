import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../route/app_route.dart';

SnackbarController showSnackBar({required title, required String text}){
  return Get.snackbar(title, text,
  snackPosition: SnackPosition.TOP,
  maxWidth: 250.w,

  backgroundColor: Colors.white,

  onTap: (snack) {
    Get.toNamed(AppRoute.favorite);
  },
  
  );
}