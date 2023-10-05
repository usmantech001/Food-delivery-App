import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:ecommerce_app1/pages/welcome/controller.dart';
import 'package:ecommerce_app1/pages/welcome/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) {
                  controller.onpageChanged(value);
                },
                children: [
                  buildPageView(
                      'Choose Product',
                      'Find your best product from popular shop without any delay',
                      'Next',
                      1,
                      _pageController),
                  buildPageView(
                      'Choose Product',
                      'Find your best product from popular shop without any delay',
                      'Next',
                      2,
                      _pageController),
                  buildPageView(
                      'Choose Product',
                      'Find your best product from popular shop without any delay',
                      'Get Started',
                      3,
                      _pageController)
                ],
              ),
              Positioned(
                bottom: 50.h,
                child: DotsIndicator(
                  position: controller.state.pageNum.value,
                  dotsCount: 3,
                  decorator: const DotsDecorator(
                      activeColor: AppColors.mainColor,
                      size: Size.square(10.0),
                      activeSize: Size(15.0, 10.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
