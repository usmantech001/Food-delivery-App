import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/pages/welcome/state.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeController extends GetxController {
  final state = WelcomState();
  SharedPreferences sharedPreferences;
  WelcomeController({required this.sharedPreferences});
  PageController pageController = PageController();

  @override
  void onInit() {
    pageController = PageController(initialPage: 0, keepPage: true);
    super.onInit();
   
  }

  @override
 

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  onpageChanged(value) {
    state.pageNum.value = value;
  }

  nextBtn(index, controller) {
    if (index < 3) {
      controller.animateToPage(index,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.decelerate);
    } else {
      Get.toNamed(AppRoute.signIn);
      sharedPreferences.setBool(AppConstants.ALREADY_LOGIN, true);
    }
  }
  bool get alreadyOpenApp{
   return sharedPreferences.containsKey(AppConstants.ALREADY_LOGIN);
   }
}
