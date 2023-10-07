import 'package:ecommerce_app1/middleware/middleware.dart';
import 'package:ecommerce_app1/models/order_model.dart';
import 'package:ecommerce_app1/pages/bottomnav/binding.dart';
import 'package:ecommerce_app1/pages/bottomnav/bottomnav.dart';
import 'package:ecommerce_app1/pages/cart/cart_page.dart';
import 'package:ecommerce_app1/pages/detail/detail_page.dart';
import 'package:ecommerce_app1/pages/favorite/favorite_page.dart';
import 'package:ecommerce_app1/pages/payment/payment_page.dart';
import 'package:ecommerce_app1/pages/recommended/binding.dart';
import 'package:ecommerce_app1/pages/recommended/recomended_detail_page.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_page.dart';
import 'package:ecommerce_app1/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/location/location_page.dart';
import '../pages/signUp/sign_up_page.dart';

class AppRoute{
 static const String welcome = '/';
 static const String signIn = '/sign_in';
 static const String signUp = '/sign_up';
 static const String bottomNav= '/bottom_Nav';
 static const String detail= '/detail';
 static const String cart= '/cart';
 static const String location= '/location';
 static const String recommendedDetailPage ='/recommendedDetailPage';
 static const String payment= '/payment';
 static const String favorite = '/favorite';


 static List<GetPage> getPages =[
    GetPage(
      name: welcome, page:()=>const WelcomePage(),
      middlewares: [
        WelcomeMiddleware(priority: 1)
      ]
    ),
     GetPage(
      name: signIn, page:()=> SignInPage(),
     curve: Curves.decelerate,
     transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300),
     
    ),
    GetPage(
      name: signUp, page:()=> SignUpPage(),
      curve: Curves.decelerate,
      transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300)
   
    ),
    GetPage(
      name: bottomNav, page:()=> BottomNavPage(),
      bindings: [
        BottomNavBinding(),
        ],
      curve: Curves.decelerate,
      transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300)
   
    ),
       GetPage(
      name: detail, page:()=>const DetailPage(),
      curve: Curves.decelerate,
      transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300),
    ),
     GetPage(
      name: cart, page:()=>const CartPage(),
      curve: Curves.decelerate,
      transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300),
    ),
      GetPage(
      name: recommendedDetailPage, page:()=>const RecommendedDetailPage(),
      curve: Curves.decelerate,
      transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300),
      binding: RecommendedDetailBinding()
    ),
     GetPage(
      name: location, page:()=>const LocationPage(),
      curve: Curves.decelerate,
      transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300),
    ),
     GetPage(
      name: favorite, page:()=>const FavoritePage(),
      curve: Curves.decelerate,
      transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300),
    ),
     GetPage(
      name: payment, page:()=> PaymentScreen(
        orderModel: OrderModel(
          id: int.parse(Get.parameters['id']!), 
          userId: int.parse(Get.parameters['userID']!)
          ),

      ),
      curve: Curves.decelerate,
      transition: Transition.rightToLeft,
      transitionDuration:const Duration(milliseconds: 300),
    ),
  ];
}