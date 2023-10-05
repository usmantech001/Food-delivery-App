import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:ecommerce_app1/pages/cart/controller.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../api/controller.dart';

Widget bottomBar(ProductModel product, PopularProductController controller) {
  return  Container(
      height: 80.h,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp))),
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 50.h,
                width: 110.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.increment(false);
                        },
                        child: Icon(
                          Icons.remove,
                          size: 22.sp,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: reuseableText(controller.quantity.toString(),
                          size: 22.sp),
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.increment(true);
                        },
                        child: Icon(
                          Icons.add,
                          size: 22.sp,
                        ))
                  ],
                )),
            GestureDetector(
              onTap: () {
                if(controller.quantity!=0){
                  controller.addToCart(product);
                  Get.snackbar('Product Added', 'Product has beeen added to the cart',
                  backgroundColor: AppColors.mainColor,colorText: Colors.white, );
                }
                
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.h,
                width: 190.w,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    reuseableText('\$${product.price!}',
                        color: Colors.white, size: 22),
                    reuseableText(' | Add to cart',
                        size: 22, color: Colors.white),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  
}

Widget mainDetail(PopularProductController controller, ProductModel product) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      reuseableDetailText(product.name!),
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          Row(
            children: List.generate(5, (index) {
              return const Icon(
                Icons.star,
                color: Color.fromARGB(255, 243, 220, 14),
              );
            }),
          ),
          reuseableText('  {305 Reviews}', size: 20)
        ],
      ),
      SizedBox(
        height: 10.h,
      ),
      reuseableText('Description', size: 23),
      reuseableText(product.description!, size: 18)
    ],
  );
}

Widget incrandDecreCont(IconData icon) {
  return Container(
    height: 30,
    width: 30,
    color: Colors.deepPurple.shade300,
    child: Icon(
      icon,
      color: Colors.white,
    ),
  );
}

Widget reuseableDetailText(String text,
    {double size = 25,
    fontWeight = FontWeight.normal,
    color = Colors.black,
    textdeco = TextDecoration.none}) {
  return Text(
    text,
    maxLines: 1,
    style: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      decoration: textdeco,
    ),
  );
}

Widget buildTopRow(CartController controller) {
  return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            Get.back();
          },
          child: buildContainer(Icons.navigate_before)),
        GestureDetector(
          onTap: (){
            Get.toNamed(AppRoute.cart);
          },
          child: Stack(
            children: [
              buildContainer(Icons.shopping_cart_sharp),
              controller.itemLenght==0?Container(): Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      
                      alignment: Alignment.center,
                      height: 20.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20.sp)
                      ),
                      child: reuseableText(controller.itemLenght.toString(), color: Colors.white, size: 15.sp),
                    ),
                  )
            ],
          ),
        )
      ],
    );
  
}

Widget buildContainer(IconData icon) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: Colors.grey.shade300),
    child: Icon(icon),
  );
}
