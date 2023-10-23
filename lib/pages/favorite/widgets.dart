import 'package:ecommerce_app1/models/fav_model.dart';
import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:ecommerce_app1/pages/favorite/fav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/colors/constants.dart';
import '../../route/app_route.dart';
import '../detail/widgets.dart';
import '../signIn/sign_in_widget.dart';

Widget favoriteContainer( FavoriteModel item, FavoriteController controller){
 
  return GestureDetector(
    onTap: () {
       Get.toNamed(AppRoute.detail,
                            arguments: {'product': item.product});
            
    },
    child: Container(
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
                          '${AppConstants.BASEURL}/uploads/${item.img}'))
                  ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 105,
                            child: reuseableDetailText(item.name!, size: 22)),
                           GestureDetector(
                            onTap: () {
                             controller.removeFromFavourite(item.product!);
                            },
                            child:  Icon(Icons.cancel),
                           )
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          reuseableText('\$ ${item.price}.00', size: 20.sp, color: Colors.deepPurple.shade800),
                         
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
  );

}
