import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app1/api/controller.dart';
import 'package:ecommerce_app1/api/recommended_controller.dart';
import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/pages/detail/widgets.dart';
import 'package:ecommerce_app1/pages/home/controller.dart';
import 'package:ecommerce_app1/pages/welcome/widgets.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:ecommerce_app1/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AppBar buildHomeAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.h),
      child: Container(
        height: 1,
        color: Colors.grey.shade100,
      ),
    ),
    title: Container(
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          barContainer(Icons.person),
          barContainer(Icons.notification_important_rounded)
        ],
      ),
    ),
  );
}

Widget barContainer(IconData icon) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.grey.shade200),
          child: Icon(icon),
        )
      ],
    ),
  );
}



Widget buildHomePageView(
  BuildContext context,

) {
  return GetBuilder<HomeController>(
    builder: (controller) {
      return GetBuilder<PopularProductController>(
        builder: (popularProductController) {
          return popularProductController.isLoading?Center(child: customLoader()): Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25.h),
                  height: 250,
                  child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.changePageView,
                      itemCount: popularProductController.popularProductList.length,
                      itemBuilder: (context, index) {
                        var product =
                            popularProductController.popularProductList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.detail,
                                arguments: {'product': product});
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20.w),
                                height: 190,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            '${AppConstants.BASEURL}/uploads/${product.img!}'))),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  margin: EdgeInsets.only(right: 35.w, left: 15.w),
                                  padding: EdgeInsets.only(
                                      left: 10.w, right: 10.w, top: 10.h),
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 1.w,
                                        
                                            offset: Offset(5.w, 10.h),
                                            color: Colors.grey.shade200),
                                        BoxShadow(
                                          color: Colors.transparent,
                                          blurRadius: 1.w,
                                          //spreadRadius: 1.w,
                                          offset: const Offset(-5, -5),
                                        )
                                      ]),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      reuseableDetailText(product.name!, size: 22),
                                      SizedBox(height: 5.h,),
                                      Row(
                                        children: [
                                          Row(
                                            children: List.generate(product.stars!, (index) {
                                              return Icon(Icons.star, color: AppColors.mainColor, size: 20.sp,);
                                            }),
                                          ),
                                          SizedBox(width: 6.w,),
                                          buildText('${product.stars} star', size: 18.0),
                                         
                                        ],
                                      ),
                                      SizedBox(height: 5.h,),
                                       reuseableDetailText('\$ ${product.price}.00', size: 18.0)

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.h),
                  child: DotsIndicator(
                    mainAxisAlignment: MainAxisAlignment.center,
                    dotsCount: popularProductController.popularProductList.length,
                    position: controller.currentIndex,
                    decorator: DotsDecorator(
                        activeColor: Colors.deepPurple,
                        activeSize: Size(16.w, 8.h),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                )
              ],
            );
        }
      );
    }
  );
  
}

Widget gridView() {
  return GetBuilder<RecommendedProductController>(
    builder: (recommendedController) {
      return  SliverGrid(
        
        delegate: SliverChildBuilderDelegate(
          childCount: recommendedController.recommendedProductist.length,
          (context, index) {
          var recommendedProduct = recommendedController.recommendedProductist[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.detail,
                            arguments: {'product': recommendedProduct});
            },
            child: recommendedController.isLoading?Center(child: customLoader()): 
            Container(
              //height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.sp)
              ),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                       // color: Colors.black, 
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.sp),
                          topRight: Radius.circular(10.sp)
                        ),

                        image: DecorationImage(
                          image: NetworkImage('${AppConstants.BASEURL}/uploads/${recommendedProduct.img!}'),
                          fit: BoxFit.cover
                          )),
                       
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 10),
                    //height: 50,
                    width: double.maxFinite,
                  // color: Colors.red,
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       reuseableDetailText(recommendedProduct.name!, size: 18.0),
                       reuseableDetailText('\$ ${recommendedProduct.price}.00', size: 18.0)
                     ],
                   ),
                  )
                ],
              ),
            ),
          );
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 0.74
            //childAspectRatio:4
            ),
      );
    }
  );
}
