import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  HomeController();
 late PageController pageController;
 int currentIndex = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(viewportFraction: 0.88);

  }

  changePageView(index){
    currentIndex= index;
    update();
  }
}