import 'package:ecommerce_app1/auth/auth_controller.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../pages/welcome/controller.dart';


class WelcomeMiddleware extends GetMiddleware{

  @override
  int? priority =0;
 WelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route){
    var authController = Get.find<AuthController>();
    var welcomeController = Get.find<WelcomeController>();
    if(welcomeController.alreadyOpenApp==false){
      return null;
    }
  else if(authController.isLoggedIn==true){
   
    return const RouteSettings(name: AppRoute.bottomNav);
  }else{
    return const RouteSettings(name: AppRoute.signIn);
  }
  
  }
}