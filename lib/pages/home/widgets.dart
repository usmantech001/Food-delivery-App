import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app1/api/controller.dart';
import 'package:ecommerce_app1/api/recommended_controller.dart';
import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/pages/detail/widgets.dart';
import 'package:ecommerce_app1/pages/favorite/fav_controller.dart';
import 'package:ecommerce_app1/pages/home/controller.dart';
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

Widget searchView() {
  return Container(
    margin: EdgeInsets.only(left: 20.w, right: 20.0.w, top: 10.h),
    height: 50,
    width: 393.w,
    child: Row(
      children: [
        Container(
          height: 40.h,
          width: 280.w,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          child: const TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search your favorite',
              hintStyle: TextStyle(color: Colors.black38),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.deepPurple),
          child: Image.asset('images/filter.png'),
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
          return  Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15.h),
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
                                    color: index.isEven ? Colors.red : Colors.green,
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
                                            // spreadRadius: 1.w,
                                            offset: Offset(5, 10),
                                            color: Colors.grey.shade200),
                                        BoxShadow(
                                          color: Colors.transparent,
                                          blurRadius: 1.w,
                                          //spreadRadius: 1.w,
                                          offset: const Offset(-5, -5),
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      reuseableDetailText(product.name!, size: 22),

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
                    dotsCount: popularProductController.popularProductList.length == 0
                        ? 5
                        : popularProductController.popularProductList.length,
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
              Get.toNamed(AppRoute.recommendedDetailPage,
                            arguments: {'product': recommendedProduct});
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('${AppConstants.BASEURL}/uploads/${recommendedProduct.img!}'),
                    fit: BoxFit.cover
                    )),
                 
            ),
          );
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15
            //childAspectRatio:4
            ),
      );
    }
  );
}
