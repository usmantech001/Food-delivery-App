import 'package:ecommerce_app1/api/controller.dart';
import 'package:ecommerce_app1/api/recommended_controller.dart';
import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController{
  
  RecommendedProductController recommendedProductController;
  PopularProductController popularProductController;
  SearchViewController({required this.popularProductController, required this.recommendedProductController});
  final searchtextcontroller = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<ProductModel> searchResults =[];
  bool notfound = true;

  searchProduct(String productname){
    if(productname.isNotEmpty){
      searchResults=[];
      popularProductController.popularProductList.forEach((e) { 
    
        if(e.name!.toLowerCase().startsWith(productname)){
          searchResults.add(e);
         notfound = false;
         print(notfound);
          update();

        }
        
      });
      recommendedProductController.recommendedProductist.forEach((e) { 
        if(e.name!.toLowerCase().startsWith(productname)){
          searchResults.add(e);
       notfound = false;
       print(notfound);
          update();

        }
        
      });
    }
    // else if(productname.isNotEmpty && searchResults.isEmpty){
    //   print('it doesnt contain');
    // }
   
  }

  clearSearchResults(){
    searchtextcontroller.clear();
     searchResults = [];
     focusNode.unfocus();
     update();
  }
}