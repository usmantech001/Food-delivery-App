import 'package:ecommerce_app1/api/controller.dart';
import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:ecommerce_app1/pages/cart/controller.dart';
import 'package:ecommerce_app1/pages/detail/controller.dart';
import 'package:ecommerce_app1/pages/detail/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget{
  const DetailPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    var product= Get.find<DetailController>().product;
   var popularProductController= Get.find<PopularProductController>();
   var detailController = Get.find<DetailController>();
   popularProductController.initialProduct(product, Get.find<CartController>());
    return GetBuilder<PopularProductController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: bottomBar(product, controller),
            
          body: Stack(
            children: [
              
              CustomScrollView(
                controller: detailController.scrollController,
                shrinkWrap: true,
                // physics:const NeverScrollableScrollPhysics(),
                slivers:[
                  
                  SliverToBoxAdapter(
                    child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Container(
                        height: 300.h,
                        width: double.infinity,
                        color: Colors.red.shade100,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage('${AppConstants.BASEURL}/uploads/${product.img!}')),
                      ),
                     
                      Positioned(
                        top: 290,
                        left: 0,
                        right: 0,
                       
                        child: Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                       
                        decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.sp),
                            topRight: Radius.circular(25.sp)
                           )
                        ),
                        child: mainDetail(popularProductController, product)
                      ),
                      )
                    ],
                  ),
                ),
                  )
                ]
              ),
              Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Container(
                   
                  child:GetBuilder<CartController>(
                    builder: (cartController) {
                      return buildTopRow(cartController);
                    }
                  ))),
            ],
          )
        );
      }
    );
  }
}