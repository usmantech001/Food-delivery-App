import 'package:ecommerce_app1/api/controller.dart';
import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{
  DetailController();
  late ProductModel product;
  ScrollController scrollController = ScrollController();
  var popularProductController= Get.find<PopularProductController>();
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    product = Get.arguments['product'];
  }
 
  
}