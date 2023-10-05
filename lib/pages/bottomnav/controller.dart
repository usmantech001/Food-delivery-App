import 'package:ecommerce_app1/pages/favorite/favorite_page.dart';
import 'package:ecommerce_app1/pages/home/home_page.dart';
import 'package:ecommerce_app1/pages/order/order_page.dart';
import 'package:ecommerce_app1/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class BottomNavController extends GetxController{
  final state= BottomNavState();
  BottomNavController();
 late List<BottomNavigationBarItem> bottomNav;
 late List<dynamic> pages;

 @override
 void onInit(){
  super.onInit();
  bottomNav = const[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'order'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: 'Profile')
  ];

  pages= [
   const HomePage(),
    const FavoritePage(),
   const OrderPage(),
    ProfilePage()
  ];
 }

 changePage(index){
  state.currentIndex.value=index;
 }
}