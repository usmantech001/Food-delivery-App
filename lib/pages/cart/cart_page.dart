import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/pages/cart/controller.dart';
import 'package:ecommerce_app1/pages/cart/widgets.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../signIn/sign_in_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
   var cartController= Get.find<CartController>().cartRepo.sharedPreferences.getStringList(AppConstants.Cart_History_List);

 

    return GetBuilder<CartController>(
      builder: (controller) {
        return Scaffold(
         bottomNavigationBar: bottomTab(controller),
          body: Stack(
            children: [
           controller.itemLenght==0?Container(
            alignment: Alignment.center,
            child: reuseableText('Your cart is empty'),
           ):   GetBuilder<CartController>(
             builder: (controller) {
               return CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 100),
                        sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: controller.getitems.length,
                                (context, index) {
                                  var item = controller.getitems[index];
                                 
                          return cartContainer(item, controller);
                        })),
                      )
                    ],
                  );
             }
           ),
              Positioned(
                top: 00,
                left: 0,
                right: 0,
                 height: 100,
                child: Container(
                  padding: EdgeInsets.only(top: 50, left: 20.w, right: 20.w),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.back();
                          },
                        child: appIcon(Icons.arrow_back_ios_new)),
                      SizedBox(
                        width: 40.w,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.bottomNav);
                        },
                        child: appIcon(Icons.home)),
                      appIcon(Icons.shopping_cart)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
