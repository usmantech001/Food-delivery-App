
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class BottomNavPage extends GetView<BottomNavController> {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Obx(
      ()=> Scaffold(
       /* floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
          Get.toNamed(AppRoute.cart);
        },
        backgroundColor: AppColors.mainColor,
        child: const Icon(Icons.shopping_basket, color: Colors.white,)
        ),*/
        body: controller.pages[controller.state.currentIndex.value],
        bottomNavigationBar:BottomNavigationBar(
         currentIndex: controller.state.currentIndex.value,
          onTap: controller.changePage,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: controller.bottomNav
          ) ,
      ),
    );
  }
}