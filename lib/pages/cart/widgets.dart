import 'package:ecommerce_app1/pages/cart/controller.dart';
import 'package:ecommerce_app1/pages/payment/payment_page.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/colors/app_colors.dart';
import '../../constants/colors/constants.dart';
import '../../models/cart_model.dart';
import '../detail/widgets.dart';
import '../signIn/sign_in_widget.dart';

Widget appIcon(IconData icon) {
  return Container(
    height: 30.h,
    width: 30.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.sp)), 
        color: AppColors.mainColor),
    child: Icon(
      icon,
      color: Colors.white,
      size: 20,
    ),
  );
}

Widget cartContainer(CartModel item, CartController cartController) {
  
  return  Container(
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
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${AppConstants.BASEURL}/uploads/${item.img!}'))),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 205,
                      child: reuseableDetailText(item.name!, size: 22)),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        reuseableText('\$${item.price}.00', size: 20.sp, color: Colors.deepPurple.shade800),
                        Container(
                            height: 40.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      
                                      cartController.addToCart(item.product!, item.quantity!-1);
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 17.sp,
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: reuseableText(item.quantity.toString(),
                                      size: 17.sp),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      cartController.addToCart(item.product!, item.quantity!+1);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 17.sp,
                                    ))
                              ],
                            )),
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

Widget bottomTab(CartController controller){
  return   Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
     height: 80.h,
     decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.sp),
        topRight: Radius.circular(15.sp)
      ),
      color: Colors.grey.shade100,

     ),
     child: controller.itemLenght==0?Container(): Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
         // height: ,
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: reuseableText('\$${controller.totalPrice}', size: 22),
        ),
         GestureDetector(
          onTap: (){
           // controller.getCartHistory();
          //  print('pressed');
          Get.toNamed(AppRoute.payment,
           parameters: {
            'id': 100127.toString(),
            'userID': 28.toString()
           }
          );
          },
           child: Container(
           // height: ,
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.mainColor,
            ),
            child: reuseableText('Checkout', size: 22, color: Colors.white),
                 ),
         ),
      ],
     ),
  );
}
