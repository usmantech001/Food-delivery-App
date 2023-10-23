import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:ecommerce_app1/pages/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildPageView(String mainText, String subText, String btnText, int index,
    PageController pageController) {
  return GetBuilder<WelcomeController>(builder: (controller) {
    return Container(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300.h,
          ),
          Container(
            child: Text(
              mainText,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.normal),
              )
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5.w),
              child: buildText(subText, size: 18.0)),
          GestureDetector(
            onTap: () {
              controller.nextBtn(index, pageController);
            },
            child: Container(
              margin: EdgeInsets.only(top: 45.w),
              alignment: Alignment.center,
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(15)),
              child: buildText(btnText, size: 18.0, color: Colors.white),
            ),
          )
        ],
      ),
    );
  });
}

Widget buildText(String text,
    {size = 25.0, color = Colors.black, fontWeight = FontWeight.normal}) {
  return Text(text,
      style: GoogleFonts.montserrat(
        textStyle:
            TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
      ));
}
